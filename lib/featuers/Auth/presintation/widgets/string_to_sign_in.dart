import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/featuers/Auth/presintation/page/login_page.dart';

import '../../../../config/theme/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class StringToSignIn extends StatelessWidget {
  const StringToSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringManager.alreadyHaveAnAccount.tr(),
          style: TextStyle(
            color: ColorManager.foregroundL,
            fontSize: 30.sp,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: Text(
            StringManager.signIn.tr(),
            style: TextStyle(
              letterSpacing: 1.5,
              color: ColorManager.blue,
              fontSize: 25.sp,
            ),
          ),
        ),
      ],
    );
  }
}
