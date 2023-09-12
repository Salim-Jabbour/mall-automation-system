import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../config/theme/color_manager.dart';
import '../../models/home_model.dart';

class DetailForClothesProductWidget extends StatelessWidget {
  DetailForClothesProductWidget(
      {super.key, this.productModel, required this.indexProduct});

  ProductModel? productModel;
  int indexProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${StringManager.colors.tr()}: ',
            style: TextStyle(
                color: ColorManager.black,
                fontSize: 50.sp,
                fontWeight: FontWeight.w700)),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 100.h,
          width: 1.sw,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  productModel!.productDataModel?[indexProduct].color?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w),
                  child: Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor.fromHex(
                            '#${productModel!.productDataModel?[indexProduct].color![index]}'),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2)
                        ]),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text('${StringManager.sizes.tr()}: ',
            style: TextStyle(
                color: ColorManager.black,
                fontSize: 50.sp,
                fontWeight: FontWeight.w700)),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 120.h,
          width: 1.sw,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: productModel!
                        .productDataModel?[indexProduct].size?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsetsDirectional.only(start: 40.w),
                          child: Container(
                            width: 120.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 1)
                                ]),
                            child: Center(
                              child: Text(
                                productModel!.productDataModel![indexProduct]
                                    .size![index],
                                style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ));
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
