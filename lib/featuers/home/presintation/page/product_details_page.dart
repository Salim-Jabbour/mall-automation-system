import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/core/resource/asset_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/utils/global_snackbar.dart';
import 'package:jessy_mall/core/widgets/custom_button.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/home/models/home_model.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resource/const_manager.dart';
import '../manager/product_bloc/product_bloc.dart';
import '../widget/details_for_clothes_product_widget.dart';
import '../widget/details_for_furniture_product_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage(
      {super.key,
      required this.categoryName,
      this.productModel,
      required this.index});
  final String categoryName;
  ProductModel? productModel;
  final int index;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<ProductBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: 1.sh,
            width: 1.sw,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(120.r)),
                  child: Stack(
                    children: [
                      SizedBox(
                          height: 900.h,
                          width: 1.sw,
                          child: Image.network(
                            widget.productModel!.productDataModel?[widget.index]
                                    .image ??
                                'data:image/jpeg;base64,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',
                            fit: BoxFit.fill,
                          )),
                      widget.productModel!.productDataModel?[widget.index]
                                  .discountPercent ==
                              null
                          ? const SizedBox.shrink()
                          : Positioned(
                              top: 400.h,
                              child: Container(
                                width: 240.w,
                                height: 90.h,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 2,
                                          spreadRadius: 2)
                                    ]),
                                child: Center(
                                  child: Text(
                                    '${widget.productModel!.productDataModel?[widget.index].discountPercent} ${StringManager.off.tr()}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40.sp),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 70.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productModel!.productDataModel?[widget.index]
                                .name ??
                            '',
                        style: TextStyle(
                            color: ColorManager.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 50.sp),
                      ),
                      SizedBox(
                        height: 100.w,
                        width: 100.w,
                        child: BlocConsumer<ProductBloc, ProductState>(
                          listener: (context, state) {
                            if (state is ProductAddToFavoriteFailed) {
                              gShowErrorSnackBar(
                                  context: context,
                                  message: state.faliuer.message);
                            }
                            if (state is ProductAddToFavoriteSuccess) {
                              gShowSuccessSnackBar(
                                  context: context,
                                  message: StringManager.addSuccess.tr());
                            }
                          },
                          builder: (context, state) {
                            return state is ProductAddToFavoriteLoading
                                ? Lottie.asset(AssetJsonManager.loading,
                                    height: 40.h)
                                : IconButton(
                                    onPressed: () {
                                      context.read<ProductBloc>().add(
                                          ProductAddToFavoriteRequested(
                                              token: context
                                                      .read<AuthBloc>()
                                                      .token ??
                                                  '',
                                              productId: widget
                                                      .productModel!
                                                      .productDataModel?[
                                                          widget.index]
                                                      .id ??
                                                  0));
                                    },
                                    icon: Icon(Icons.stars));
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 500.h,
                  width: 1.sh,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 140.w),
                    child: widget.categoryName == ConstManager.clothesCategory
                        ? DetailForClothesProductWidget(
                            productModel: widget.productModel,
                            indexProduct: widget.index,
                          )
                        : DetailForFurnitureProduct(
                            productModel: widget.productModel,
                            indexProduct: widget.index,
                          ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //discount
                      Text(
                        '${widget.productModel!.productDataModel?[widget.index].price}',
                        style: TextStyle(
                            color: ColorManager.grey,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.w700,
                            decoration: widget
                                        .productModel!
                                        .productDataModel?[widget.index]
                                        .discountPercent ==
                                    null
                                ? TextDecoration.none
                                : TextDecoration.lineThrough,
                            decorationColor: ColorManager.grey),
                      ),
                      widget.productModel!.productDataModel?[widget.index]
                                  .discountPercent ==
                              null
                          ? const SizedBox.shrink()
                          : Text(
                              '${widget.productModel!.productDataModel?[widget.index].priceAfterDiscount}',
                              style: TextStyle(
                                color: ColorManager.red,
                                fontSize: 45.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2.h,
                  color: ColorManager.grey,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 40.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(StringManager.productDescription.tr(),
                          style: TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 50.sp)),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: 300.h,
                          width: 1.sw,
                          child: Text(
                              '${widget.productModel!.productDataModel?[widget.index].description}',
                              style: TextStyle(
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40.sp)),
                        ),
                      ),

                      // Center(
                      //   child: CustomButton(
                      //     onPressed: () {},
                      //     text: StringManager.addToCard.tr(),
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
