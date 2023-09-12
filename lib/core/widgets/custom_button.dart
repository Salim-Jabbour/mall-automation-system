import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.onPressed,
      required this.text,
      super.key,
      this.color,
      this.width});
  final String text;
  final Function() onPressed;
  final Color? color;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 520.w,
      height: 155.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? ColorManager.foregroundL,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30.0.r), // Adjust the radius as needed
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 35.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
