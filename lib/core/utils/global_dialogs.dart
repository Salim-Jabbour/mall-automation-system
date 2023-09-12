import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';

Future<dynamic> gShowWidgetDialog(
    {required BuildContext context, required Widget child}) {
  return showPlatformDialog(
    context: context,
    builder: (_) => BasicDialogAlert(
      content: SizedBox(
        height: 200.h,
        child: Center(child: child),
      ),
      actions: <Widget>[
        BasicDialogAction(
          title: Text(
            'الخروج',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: ColorManager.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
