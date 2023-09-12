import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';

class SearchedProductCardWidget extends StatelessWidget {
  const SearchedProductCardWidget({
    required this.imageNetworkSource,
    required this.productName,
    required this.quantity,
    required this.id,
    required this.price,
    required this.category,
    super.key,
  });

  final String imageNetworkSource, productName, quantity, id, category;
  final double price;
  // final List<String> subCategoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 50.w,
        bottom: 10.h,
        top: 10.h,
        end: 50.w,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(
              height: 280.w,
              width: 280.w,
              child: Image.network(
                imageNetworkSource,
                // scale: 1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          SizedBox(
            height: 250.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorManager.foregroundL,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  quantity,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: 35.sp,
                  ),
                ),
                Text(
                  price.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: 35.sp,
                  ),
                ),
                Text(
                  category.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: 35.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
