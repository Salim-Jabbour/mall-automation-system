import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget(
      {required this.titleInListTile,
      required this.subtitleInListTile,
      required this.navigatorFunc,
      this.width = 950,
      this.height = 300,
      this.cardColor = Colors.white,
      this.textColor = const Color(0xFF333333),
      super.key});

  final String titleInListTile, subtitleInListTile;
  final void Function()? navigatorFunc;
  final double? width;
  final double? height;
  final Color? cardColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 30.h),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        width: width?.w,
        height: height?.h,
        child: InkWell(
          onTap: navigatorFunc,
          child: Card(
            color: cardColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        titleInListTile,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // titleAlignment: ,
                      subtitle: Text(
                        subtitleInListTile,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorManager.grey,
                          fontSize: 26.sp,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: navigatorFunc,
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: textColor,
                      size: 50.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
