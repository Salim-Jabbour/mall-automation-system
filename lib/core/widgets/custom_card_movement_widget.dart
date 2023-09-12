import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resource/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class CustomCardMovementWidget extends StatelessWidget {
  double height;
  final String firstTextField;
  final String secondTextField;
  final String quantityTextField;
  String? fourthTextField;
  Widget? customWidget;

  CustomCardMovementWidget({
    Key? key,
    required this.height,
    required this.firstTextField,
    required this.secondTextField,
    required this.quantityTextField,
    this.fourthTextField,
    this.customWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 950.w,
      height: height,
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
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  firstTextField.length >= 20
                      ? "${firstTextField.substring(0, 19)}..."
                      : firstTextField,
                  style: TextStyle(
                    color: const Color(0xFF232323),
                    fontSize: 46.sp,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  secondTextField,
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
                      quantityTextField.toString(),
                      style: TextStyle(
                        color: const Color(0xFF232323),
                        fontSize: 46.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  fourthTextField ?? "",
                  style: TextStyle(
                    color: const Color(0xFF232323),
                    fontSize: 46.sp,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          customWidget ??
              SizedBox(
                height: 0.0001.h,
              ),
        ],
      ),
    );
  }
}
