import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/cart/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:jessy_mall/featuers/cart/presentation/widgets/my_cart_body.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<CartBloc>(),
      child: Scaffold(
        body: MyCartBody(),
      ),
    );
  }
}
