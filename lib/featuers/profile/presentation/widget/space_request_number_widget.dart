import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';

class InvestorSpaceRequestNumberWidget extends StatelessWidget {
  const InvestorSpaceRequestNumberWidget({
    required this.index,
    required this.color,
    super.key,
  });

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 250.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: color,
      ),
      child: Center(
        child: Text(
          "$index",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.sp,
          ),
        ),
      ),
    );
  }
}
