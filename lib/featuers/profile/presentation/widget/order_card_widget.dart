import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/string_manager.dart';
import '../../../../delivery manager/features/home/presentation/page/delivery_requests_details_page.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../models/profile_model.dart';
import '../page/my_order_details_page.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    required this.userNameText,
    required this.dateText,
    required this.amountText,
    required this.quantityText,
    required this.orderDetailsId,
    required this.isDelivered,
    required this.profileOrderDetails,
    super.key,
  });

  final String userNameText, dateText, quantityText, amountText;
  final int orderDetailsId;
  final bool isDelivered;
  final List<ProfileOrderDetails> profileOrderDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 950.w,
      height: 400.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x338A959E),
            blurRadius: 40,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userNameText,
                  style: TextStyle(
                    color: const Color(0xFF232323),
                    fontSize: 46.sp,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  dateText,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF808080),
                    fontSize: 38.sp,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${StringManager.quantity.tr()}: ",
                      style: TextStyle(
                        color: const Color(0xFF808080),
                        fontSize: 46.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      quantityText,
                      style: TextStyle(
                        color: const Color(0xFF232323),
                        fontSize: 46.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${StringManager.totalAmount.tr()}: ',
                      style: TextStyle(
                        color: const Color(0xFF808080),
                        fontSize: 46.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      amountText,
                      style: TextStyle(
                        color: const Color(0xFF232323),
                        fontSize: 46.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding:
                EdgeInsetsDirectional.only(start: 30.w, top: 20.h, end: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100.h,
                  width: 300.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyOrderDetailsPage(
                            profileOrderDetails: profileOrderDetails,
                            orderDate: dateText,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.foregroundL,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Text(
                      StringManager.details.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  isDelivered
                      ? StringManager.delivered.tr()
                      : StringManager.failed.tr(),
                  style: TextStyle(
                    fontSize: 38.sp,
                    fontFamily: 'Nunito Sans',
                    color: isDelivered ? Colors.green : Colors.red,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
