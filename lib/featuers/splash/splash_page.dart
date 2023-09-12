import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/const_manager.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/Auth/presintation/page/login_page.dart';
import 'package:jessy_mall/featuers/bottom_navigation_bar/presintation/page/bottom_navigation_bar.dart';

import '../../core/resource/asset_manager.dart';
import '../../delivery manager/features/home/presentation/page/delivery_home_page.dart';
import '../../warehouse manager/warehouse_home/presintation/pages/warehouse_home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    context.read<AuthBloc>().add(AuthGetUserLocalInfo());
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      print('token ${context.read<AuthBloc>().token}');

      print('role ${context.read<AuthBloc>().role}');

      if (context.read<AuthBloc>().token == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginPage()));
      } else {
        if (context.read<AuthBloc>().role ==
            ConstManager.warehouseManagerRole) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const WarehouseHomePage()));
        } else if (context.read<AuthBloc>().role ==
            ConstManager.deliveryManagerRole) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const DeliveryHomePage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => BottomNavigationBarWidget()));
        }
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 1200.h,
          width: 1200.h,
          child: Image.asset(AssetImageManager.logo),
        ),
      ),
    );
  }
}
