import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late int productAmount;

class Counter extends StatefulWidget {
  Counter({
    super.key,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  void initState() {
    productAmount = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon(Icons.add_box_rounded),
        GestureDetector(
          onTap: () {
            setState(() {
              if (productAmount != 0) {
                productAmount--;
              }
            });
          },
          child: Container(
            width: 75.h,
            height: 75.h,
            decoration: ShapeDecoration(
              color: const Color.fromARGB(255, 226, 226, 226),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                size: 40.h,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(productAmount.toString()),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              productAmount++;
            });
          },
          child: Container(
            width: 75.h,
            height: 75.h,
            decoration: ShapeDecoration(
              color: const Color.fromARGB(255, 226, 226, 226),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                size: 40.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
