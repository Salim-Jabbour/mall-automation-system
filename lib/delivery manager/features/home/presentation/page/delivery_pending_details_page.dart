import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/utils/global_snackbar.dart';
import 'package:jessy_mall/core/widgets/custom_button.dart';

import '../../../../../core/resource/string_manager.dart';
import '../../../../../core/widgets/header_page.dart';
import '../../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../models/delivery_order_model.dart';
import '../bloc/delivery_manager_bloc/dilevery_manager_home_bloc.dart';
import '../widgets/delivery_manager_order_details_widget.dart';
import 'delivery_home_page.dart';

class DeliveryPendingDetailsPage extends StatefulWidget {
  const DeliveryPendingDetailsPage({
    Key? key,
    required this.deliveryDataOrderModel,
  }) : super(key: key);

  // final int deliveryOrderDetailId;
  final DeliveryDataOrderModel? deliveryDataOrderModel;

  @override
  State<DeliveryPendingDetailsPage> createState() =>
      _DeliveryPendingDetailsPageState();
}

class _DeliveryPendingDetailsPageState
    extends State<DeliveryPendingDetailsPage> {
  // List<DeliveryOrderDetailsModel> OrderDetailsList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<DileveryManagerHomeBloc>(),
      child: Scaffold(
        body: BlocBuilder<DileveryManagerHomeBloc, DileveryManagerHomeState>(
          builder: (context, state) {
            return Column(
              children: [
                HeaderPage(
                  left: true,
                  title: StringManager.orderDetails.tr(),
                  // right: IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 1520.h,
                  width: 1000.w,
                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 30.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${StringManager.to.tr()}: ',
                                style: const TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 16,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.deliveryDataOrderModel?.from_who ?? " ",
                                style: const TextStyle(
                                  color: Color(0xFF232323),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                widget.deliveryDataOrderModel?.date ?? " ",
                                style: const TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 960.w,
                          child: const Divider(
                            color: Color(0xFF999999),
                          ),
                        ),
                        SizedBox(
                          height: 1300.h,
                          width: 900.w,
                          child: ListView.builder(
                            // itemCount: OrderDetailsList.length,
                            itemCount: widget.deliveryDataOrderModel
                                    ?.store_products?.length ??
                                0,
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            itemBuilder: (context, index) {
                              return DeliveryManagerOrderDetailsWidget(
                                imageNetworkSource: widget
                                        .deliveryDataOrderModel
                                        ?.store_products?[index]
                                        .image ??
                                    "https://i.ytimg.com/vi/5gO0xpY_Y3E/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhCIFQoZTAP&rs=AOn4CLBdtxYbLyxjQVkn_V7q9JEJDnP0Bg",
                                productName: widget.deliveryDataOrderModel
                                        ?.store_products?[index].name ??
                                    "Product X",
                                storeName: widget.deliveryDataOrderModel
                                        ?.store_products?[index].store_name ??
                                    "Store name",
                                quantity: widget.deliveryDataOrderModel
                                        ?.store_products?[index].quantity
                                        .toString() ??
                                    "0",
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  width: 900.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${StringManager.location.tr()}: ",
                        style: TextStyle(
                          color: const Color(0xFF808080),
                          fontSize: 46.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.deliveryDataOrderModel!.location!.length > 20
                            ? "${widget.deliveryDataOrderModel!.location!.substring(0, 20)}..."
                            : "${widget.deliveryDataOrderModel!.location!}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF232323),
                          fontSize: 38.sp,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 900.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${StringManager.price.tr()}: ",
                        style: TextStyle(
                          color: const Color(0xFF808080),
                          fontSize: 46.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$${widget.deliveryDataOrderModel?.total_price ?? " "}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF232323),
                          fontSize: 38.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                SizedBox(
                    width: 980.w,
                    child: CustomButton(
                        onPressed: () {
                          String token = context.read<AuthBloc>().token!;
                          context.read<DileveryManagerHomeBloc>().add(
                                DilevryPostDeliverdStatuesOrderEvent(
                                    token: token,
                                    id: widget.deliveryDataOrderModel!.id!,
                                    statues: 1),
                              );

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DeliveryHomePage()),
                              (Route<dynamic> route) => false);
                          gShowSuccessSnackBar(
                              context: context, message: "Ordered is deliverd");
                        },
                        text: StringManager.confirm.tr()))
              ],
            );
          },
        ),
      ),
    );
  }
}


/*
String token = context.read<AuthBloc>().token!;
                        context.read<DileveryManagerHomeBloc>().add(
                            DilevryPostApprovedStatuesOrderEvent(
                                token: token,
                                id: widget.deliveryDataOrderModel!.id!,
                                statues: "approved"));*/