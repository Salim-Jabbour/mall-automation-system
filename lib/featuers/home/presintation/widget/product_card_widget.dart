import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/utils/global_snackbar.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/home/models/home_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';
import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/asset_manager.dart';
import '../../../../core/widgets/custom_counter.dart';
import '../manager/product_bloc/product_bloc.dart';

class productCardWidget extends StatelessWidget {
  productCardWidget({super.key, this.productModel, required this.index});
  ProductModel? productModel;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: ColorManager.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 3),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(50.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.network(
                  productModel!.productDataModel?[index].image ?? '',
                  // scale: 1,
                  fit: BoxFit.fill, height: 600.h,
                  width: 1.sw,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20.w, bottom: 40.h),
                child: BlocConsumer<ProductBloc, ProductState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ProductBloc>()
                            .add(ProductAddToCartRequested(
                              token: context.read<AuthBloc>().token ?? '',
                              productId:
                                  productModel!.productDataModel?[index].id ??
                                      0,
                              quantity: productAmount,
                            ));
                      },
                      child: Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              color: const Color(0x60606066),
                              borderRadius: BorderRadius.circular(30.r),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ]),
                          child: state is ProductAddToCartLoading
                              ? Lottie.asset(
                                  AssetJsonManager.loading,
                                  height: 60.h,
                                )
                              : Center(
                                  child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 50.h,
                                ))),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 25.w),
            child: Text(
              productModel!.productDataModel?[index].name ?? '',
              style: TextStyle(
                  color: ColorManager.black,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${productModel!.productDataModel?[index].price}',
                style: TextStyle(
                    color: ColorManager.black,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700),
              ),
              Counter(),
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
