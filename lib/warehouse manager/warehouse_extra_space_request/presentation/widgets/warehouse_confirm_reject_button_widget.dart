import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class WarehouseConfirmOrRejectButtonWidget extends StatelessWidget {
  const WarehouseConfirmOrRejectButtonWidget({
    required this.width,
    required this.height,
    required this.onpressed,
    required this.isConfirm,
    super.key,
  });

  final double width, height;
  final void Function() onpressed;
  final bool isConfirm;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isConfirm ? ColorManager.green : ColorManager.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Text(
          isConfirm ? StringManager.confirm.tr() : StringManager.reject.tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 46.sp,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
