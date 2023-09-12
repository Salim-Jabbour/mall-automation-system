import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final String? hintText;
  final IconData icon;
  final TextEditingController textEditingController;
  final Widget? suffixIconWidget;
  final bool? visibility;
  final TextInputType keybordType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmittedFunc;
  final Color? textFieldColor;
  final String? initialValue;
  final bool? enabled;

  const CustomTextField(
      {required this.keybordType,
      required this.width,
      this.hintText,
      required this.icon,
      required this.textEditingController,
      this.suffixIconWidget,
      this.visibility,
      required this.validator,
      this.onFieldSubmittedFunc,
      super.key,
      this.textFieldColor,
      this.initialValue,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: textFieldColor ??
              ColorManager.textFieldFill, // Adjust the color to your preference
        ),
        child: TextFormField(
          enabled: enabled,
          initialValue: initialValue,
          controller: textEditingController,
          keyboardType: keybordType,
          obscureText: visibility ?? false,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: const BorderSide(color: Colors.black),
            ),
            prefixIcon: Icon(
              icon,
              color: ColorManager.foregroundL,
              size: MediaQuery.of(context).size.width * 0.04,
            ),
            suffixIcon: suffixIconWidget ?? suffixIconWidget,
          ),
          validator: validator,
          onFieldSubmitted: onFieldSubmittedFunc,
        ),
      ),
    );
  }
}
