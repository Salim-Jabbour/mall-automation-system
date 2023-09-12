import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/const_manager.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  BottomNavigationBarWidget({
    super.key,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: index,
          elevation: 5,
          backgroundColor: Colors.black,
          height: 120.h,
          // curveSize: 100.h,
          onTap: (int i) {
            setState(() {
              index = i;
            });
          },
          items: [
            TabItem(
              icon: Icons.home,
              activeIcon: Icon(
                Icons.home,
                size: 80.h,
              ),
            ),
            TabItem(
              icon: Icons.local_grocery_store_sharp,
              activeIcon: Icon(
                Icons.local_grocery_store_sharp,
                size: 80.h,
              ),
            ),
            TabItem(
              icon: Icons.favorite,
              activeIcon: Icon(
                Icons.favorite,
                size: 80.h,
              ),
            ),
            TabItem(
              icon: Icons.person,
              activeIcon: Icon(
                Icons.person,
                size: 80.h,
              ),
            ),
          ],
        ),
        body: ConstManager.pageOptions[index]);
  }
}
