import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';

import '../../../../config/theme/color_manager.dart';
import '../page/register_page.dart';
import 'package:easy_localization/easy_localization.dart';

class StringToSignUp extends StatelessWidget {
  const StringToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringManager.doNotHaveAnAccount.tr(),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
          child: Text(
            StringManager.signUp.tr(),
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
