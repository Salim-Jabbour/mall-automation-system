import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/string_manager.dart';
import '../../../../core/widgets/header_page.dart';
import '../../models/profile_model.dart';
import '../widget/order_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({required this.profileOrdersModel, super.key});

  final List<ProfileOrdersModel> profileOrdersModel;
  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderPage(
            left: true,
            title: StringManager.orders.tr(),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: widget.profileOrdersModel.length,
            padding: EdgeInsets.symmetric(
              vertical: 50.h,
              horizontal: 30.w,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: OrderCardWidget(
                  userNameText:
                      widget.profileOrdersModel[index].fromWho ?? "ss",
                  dateText:
                      widget.profileOrdersModel[index].date ?? "22/08/2023",
                  quantityText:
                      widget.profileOrdersModel[index].totalQuantity ?? "00",
                  amountText:
                      widget.profileOrdersModel[index].totalPrice ?? "10000",
                  orderDetailsId: 5,
                  isDelivered:
                      widget.profileOrdersModel[index].deliveredStatus == 1
                          ? true
                          : false,
                  profileOrderDetails:
                      widget.profileOrdersModel[index].storeProducts!.isEmpty
                          ? []
                          : widget.profileOrdersModel[index].storeProducts!,
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
