import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../config/theme/color_manager.dart';
import 'my_cart_body.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

Future<Position> getCurrentLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitude = position.latitude;
    double longitude = position.longitude;

    print("Latitude: $latitude, Longitude: $longitude");
    return position;
  } catch (e) {
    print("Error getting location: $e");
    return const Position(
        longitude: 0,
        latitude: 0,
        timestamp: null,
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0);
  }
}

Future<String> getAddressFromCoordinates(
    double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    if (placemarks != null && placemarks.isNotEmpty) {
      print("i am in if"); //now work
      Placemark placemark = placemarks[0];

      String name = placemark.name ?? '';
      String street = placemark.street ?? '';
      String subLocality = placemark.subLocality ?? '';
      String locality = placemark.locality ?? '';
      String administrativeArea = placemark.administrativeArea ?? '';
      String country = placemark.country ?? '';

      String address = "$locality,  $street $subLocality";

      print("Address: $address");
      return address;
    } else {
      print("No address found for the coordinates.");
      return "Can't get location";
    }
  } catch (e) {
    print("i am in catch");
    print("Error getting address: $e");
    return "";
  }
}

class ShippingAddressCard extends StatefulWidget {
  String homeText;
  String? addressText;
  ShippingAddressCard({
    Key? key,
    required this.homeText,
    this.addressText,
  }) : super(key: key);

  @override
  State<ShippingAddressCard> createState() => _ShippingAddressCardState();
}

class _ShippingAddressCardState extends State<ShippingAddressCard> {
  final TextEditingController alertDialogController = TextEditingController();
  String? stringAddress;
  String? geocodindAddress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 1000.w,
        height: 250.h,
        decoration: BoxDecoration(
          color: ColorManager.backgroundL,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x338A959E),
              blurRadius: 40,
              offset: Offset(0, 7),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.homeText,
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 50.sp,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await _determinePosition();
                          Position sami = await getCurrentLocation();

                          // List<Placemark> placemarks = await placemarkFromCoordinates(
                          //     50.405016, 10.512531,
                          //     localeIdentifier: "en");
                          // print(placemarks);
                          // print("$placemarks");

                          geocodindAddress = await getAddressFromCoordinates(
                              sami.latitude, sami.longitude);
                          addressLocation = geocodindAddress ?? "call my phone";
                          setState(() {});
                        },
                        icon: const Icon(Icons.add_location_alt_rounded),
                        color: ColorManager.black,
                        iconSize: 80.r,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {});
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              // contentTextStyle: TextStyle(color: Colors.amber),
                              surfaceTintColor: ColorManager.backgroundL,
                              // backgroundColor: ColorManager.backgroundL,
                              title: const Text('Shipping Address'),
                              content: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Container(
                                  width: 500.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: ColorManager
                                        .textFieldFill, // Adjust the color to your preference
                                  ),
                                  child: TextFormField(
                                    initialValue: stringAddress,
                                    onChanged: (value) {
                                      setState(() {
                                        stringAddress = value;
                                        geocodindAddress = null;
                                        addressLocation =
                                            stringAddress ?? "call my phone";
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 12.0),
                                      hintText: "add your address",
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.location_on_rounded,
                                        color: ColorManager.foregroundL,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit_square),
                        color: ColorManager.black,
                        iconSize: 80.r,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                //geocoding // textfield // empty
                geocodindAddress ?? stringAddress ?? "call me phone",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: 40.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
