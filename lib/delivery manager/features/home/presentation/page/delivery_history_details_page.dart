import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resource/string_manager.dart';
import '../../../../../core/widgets/header_page.dart';
import '../../models/delivery_order_model.dart';
import '../widgets/delivery_manager_order_details_widget.dart';

class HistoryDetailsPage extends StatefulWidget {
  final DeliveryDataOrderModel? deliveryDataOrderModel;

  const HistoryDetailsPage({
    Key? key,
    required this.deliveryDataOrderModel,
  }) : super(key: key);

  @override
  State<HistoryDetailsPage> createState() => _HistoryDetailsPageState();
}

class _HistoryDetailsPageState extends State<HistoryDetailsPage> {
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
                      widget.deliveryDataOrderModel?.date ?? "  ",
                      style: const TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 16,
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
                      // itemCount: OrderDetailsList.length,
                      itemCount: widget
                              .deliveryDataOrderModel?.store_products?.length ??
                          0,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                      itemBuilder: (context, index) {
                        return DeliveryManagerOrderDetailsWidget(
                          imageNetworkSource: widget.deliveryDataOrderModel
                                  ?.store_products?[index].image ??
                              "https://media.istockphoto.com/id/912819604/vector/storefront-flat-design-e-commerce-icon.jpg?s=612x612&w=0&k=20&c=_x_QQJKHw_B9Z2HcbA2d1FH1U1JVaErOAp2ywgmmoTI=",
                          productName: widget.deliveryDataOrderModel
                                  ?.store_products?[index].name ??
                              "Product X",
                          storeName: widget.deliveryDataOrderModel
                                  ?.store_products?[index].store_name ??
                              "Store name",
                          quantity: widget.deliveryDataOrderModel
                                  ?.store_products?[index].quantity
                                  .toString() ??
                              "5",
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
