import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../cart/presentation/widgets/cart_card.dart';

class AddIncomeBody extends StatelessWidget {
  const AddIncomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPage(title: "Add Incomes", left: true),
        Flexible(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return CartCard(
                    delete: false,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 100.h),
                child: CustomButton(
                  onPressed: () {},
                  text: "Send to warehouse",
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
