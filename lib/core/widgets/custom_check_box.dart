import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';

import '../../featuers/Auth/presintation/bloc/auth_bloc.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({super.key, required this.isChecked, });
  bool isChecked;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.blue;
      }
      return ColorManager.foregroundL;
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: widget.isChecked,
          onChanged: (bool? value) {
            context.read<AuthBloc>().add(AuthChangeInvestmentOption(
                investmentOption: value == true ? 1 : 0));
            setState(() {
              widget.isChecked = value!;
            });
          },
        );
      },
    );
  }
}
