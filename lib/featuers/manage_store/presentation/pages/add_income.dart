import 'package:flutter/material.dart';

import '../widgets/add_income_body.dart';

class AddIncomePage extends StatelessWidget {
  const AddIncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: AddIncomeBody(),
      ),
    );
  }
}
