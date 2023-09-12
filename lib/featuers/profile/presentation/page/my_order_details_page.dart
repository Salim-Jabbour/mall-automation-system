import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/string_manager.dart';
import '../../../../core/widgets/header_page.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../models/profile_model.dart';
import '../widget/order_details_widget.dart';

class MyOrderDetailsPage extends StatefulWidget {
  const MyOrderDetailsPage(
      {required this.profileOrderDetails, required this.orderDate, super.key});
  final List<ProfileOrderDetails> profileOrderDetails;
  final String orderDate;
  @override
  State<MyOrderDetailsPage> createState() => _MyOrderDetailsPageState();
}

class _MyOrderDetailsPageState extends State<MyOrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderPage(
            left: true,
            title: StringManager.orderDetails.tr(),
          ),
          SizedBox(
            height: 2000.h,
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
                    child: Text(
                      widget.orderDate,
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 16,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 960.w,
                    child: const Divider(
                      color: Color(0xFF999999),
                    ),
                  ),
                  SizedBox(
                    height: 1750.h,
                    width: 900.w,
                    child: ListView.builder(
                      itemCount: widget.profileOrderDetails.length,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                      itemBuilder: (context, index) {
                        return OrderDetailsWidget(
                          imageNetworkSource: widget
                                  .profileOrderDetails[index].image ??
                              "https://i.pinimg.com/236x/4a/de/37/4ade3729109e48e14e0e3126f49df099.jpg",
                          productName: widget.profileOrderDetails[index].name ??
                              "Product X",
                          storeName:
                              widget.profileOrderDetails[index].storeName ??
                                  "Store Y",
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
