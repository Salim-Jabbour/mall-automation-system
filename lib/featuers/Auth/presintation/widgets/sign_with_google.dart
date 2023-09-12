import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../../config/theme/color_manager.dart';

class SignWithGoogle extends StatelessWidget {
  const SignWithGoogle({required this.onPressedFunctio, super.key});
  final Function() onPressedFunctio;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedFunctio,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.048,
        width: MediaQuery.of(context).size.width * 0.1,
        color: ColorManager.foregroundL,
        child: const Center(
          child: Icon(
            MaterialCommunityIcons.google,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
