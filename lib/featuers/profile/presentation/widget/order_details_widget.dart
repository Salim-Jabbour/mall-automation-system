import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    required this.imageNetworkSource,
    required this.productName,
    required this.storeName,
    super.key,
  });

  final String imageNetworkSource;
  final String productName;
  final String storeName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: 900.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox(
                height: 250.h,
                width: 250.h,
                child: Image.network(
                  imageNetworkSource,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 40.w,
            ),
            SizedBox(
              height: 230.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      color: const Color(0xFF232323),
                      fontSize: 46.sp,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    storeName,
                    // textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF808080),
                      fontSize: 38.sp,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
