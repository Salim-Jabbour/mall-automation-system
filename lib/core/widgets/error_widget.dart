import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';

import '../../config/theme/color_manager.dart';
import '../resource/asset_manager.dart';
import 'package:easy_localization/easy_localization.dart';
class FailuerWidget extends StatelessWidget {
  const FailuerWidget({
    super.key,
    required this.errorMessage,required this.onPressed
  });
 final String errorMessage;
  final dynamic Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            AssetJsonManager.error,
            height: 400.h,
          ),
          Text(
           errorMessage,
            style: TextStyle(
                color: ColorManager.black,
                fontSize: 40.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomButton(
              onPressed: onPressed,
              text: StringManager.tryAgain.tr())
        ],
      ),
    );
  }
}
