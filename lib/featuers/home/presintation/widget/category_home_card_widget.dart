import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';

class CategoryHomeCardWidget extends StatelessWidget {
  const CategoryHomeCardWidget(
      {super.key, required this.categryName, required this.imgUrl});
  final String categryName;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
        color: ColorManager.black,
      ),
      height: 650.h,
      width: 450.w,
      child: Stack(
        children: [
          Container(
            height: 650.h,
            width: 450.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.r)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 570.h,
            // left: 200.w,
            child: Container(
              width: 450.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                color: Colors.black54,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 150.w),
                child: Text(
                  categryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
