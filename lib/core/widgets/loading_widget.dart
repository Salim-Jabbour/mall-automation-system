import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/asset_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../config/theme/color_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.fullScreen = false,
  }) : super(key: key);
  final bool fullScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      color: fullScreen == true ? Colors.white54 : Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300.h,
              width: 300.w,
              child: Lottie.asset(AssetJsonManager.loading),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              StringManager.loading.tr(),
              style: TextStyle(
                  color: ColorManager.black,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
