import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';

import '../../../../config/theme/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../models/home_model.dart';
import 'details_for_clothes_product_widget.dart';

class DetailForFurnitureProduct extends StatelessWidget {
  DetailForFurnitureProduct(
      {super.key, this.productModel, required this.indexProduct});
  ProductModel? productModel;
  int indexProduct;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   children: [
        //     Text(
        //       '${StringManager.materials.tr()} : ',
        //       style: TextStyle(
        //           color: ColorManager.grey,
        //           fontWeight: FontWeight.w500,
        //           fontSize: 50.sp),
        //     ),
        //     Text(
        //       'bla,bla,bla',
        //       style: TextStyle(
        //           color: ColorManager.black,
        //           fontWeight: FontWeight.w600,
        //           fontSize: 50.sp),
        //     ),
        //   ],
        // ),
        Row(
          children: [
            Text(
              '${StringManager.color.tr()} : ',
              style: TextStyle(
                  color: ColorManager.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 50.sp),
            ),
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor.fromHex(
                      '#${productModel!.productDataModel?[indexProduct].color?.first}'),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2)
                  ]),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '${StringManager.dimensions.tr()} : ',
              style: TextStyle(
                  color: ColorManager.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 50.sp),
            ),
            Text(
              '${productModel!.productDataModel?[indexProduct].height ?? 1}*${productModel!.productDataModel?[indexProduct].width ?? 1}*${productModel!.productDataModel?[indexProduct].length ?? 1} inches',
              style: TextStyle(
                  color: ColorManager.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 50.sp),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '${StringManager.weight.tr()} : ',
              style: TextStyle(
                  color: ColorManager.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 50.sp),
            ),
            Text(
              '${productModel!.productDataModel?[indexProduct].weight} pounds',
              style: TextStyle(
                  color: ColorManager.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 50.sp),
            ),
          ],
        ),
      ],
    );
  }
}
