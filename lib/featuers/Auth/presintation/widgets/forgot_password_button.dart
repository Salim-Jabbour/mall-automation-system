import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({required this.onPressedFunctio, super.key});
  final Function() onPressedFunctio;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50.h,
        left: 550.w,
        // right: 0.w,
      ),
      child: TextButton(
        onPressed: onPressedFunctio,
        child: Text(
          "FORGOT PASSWORD?",
          style: TextStyle(
            letterSpacing: 2,
            color: ColorManager.foregroundL,
            fontSize: 25.sp,
          ),
        ),
      ),
    );
  }
}
