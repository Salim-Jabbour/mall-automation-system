import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/resource/asset_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/custom_counter.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:jessy_mall/core/widgets/loading_widget.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/home/models/home_model.dart';
import 'package:jessy_mall/featuers/home/presintation/manager/product_bloc/product_bloc.dart';
import 'package:jessy_mall/featuers/home/presintation/page/product_details_page.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/const_manager.dart';
import '../../../../core/utils/global_snackbar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../widget/product_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.storeId, required this.categoryName});
  final int storeId;
  final String categoryName;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController searchController = TextEditingController();
  CategoryModel? categoryModel;
  bool hasCategort = true;
  int selectdCategory = 0;
  ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<ProductBloc>(),
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: Colors.white,
          child: Column(
            children: [
              HeaderPage(title: StringManager.products.tr(), left: true),
              Expanded(
                child: hasCategort == false
                    ? EmptyWidget(height: 1.sh)
                    : Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          BlocBuilder<ProductBloc, ProductState>(
                            builder: (context, state) {
                              return CustomTextField(
                                keybordType: TextInputType.name,
                                width: 850.w,
                                hintText: StringManager.search.tr(),
                                icon: Icons.search,
                                textEditingController: searchController,
                                validator: (v) {
                                  return null;
                                },
                                textFieldColor:
                                    ColorManager.grey.withOpacity(0.5),
                                onFieldSubmittedFunc: (value) {
                                  context.read<ProductBloc>().add(
                                      ProductRequested(
                                          search: value,
                                          token:
                                              context.read<AuthBloc>().token ??
                                                  '',
                                          storeId: widget.storeId,
                                          categoryName: categoryModel
                                                  ?.categoryDataModel
                                                  ?.category[selectdCategory] ??
                                              '0'));
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          SizedBox(
                            height: 150.h,
                            width: 1.sw,
                            child: BlocConsumer<ProductBloc, ProductState>(
                              listener: (context, state) {
                                if (state is CategroyGetSuccess &&
                                    state.categoryModel.categoryDataModel!
                                        .category.isNotEmpty) {
                                  categoryModel = state.categoryModel;
                                  context.read<ProductBloc>().add(
                                      ProductRequested(
                                          search: searchController.text,
                                          token:
                                              context.read<AuthBloc>().token ??
                                                  '',
                                          storeId: widget.storeId,
                                          categoryName: state
                                                  .categoryModel
                                                  .categoryDataModel
                                                  ?.category
                                                  .first ??
                                              '0'));
                                }
                                if (state is CategroyGetSuccess &&
                                    state.categoryModel.categoryDataModel!
                                        .category.isEmpty) {
                                  setState(() {
                                    hasCategort = false;
                                  });
                                }
                                if (state is ProductAddToCartFailed) {
                                  gShowErrorSnackBar(
                                      context: context,
                                      message: state.faliuer.message);
                                }
                                if (state is ProductAddToCartSuccess) {
                                  gShowSuccessSnackBar(
                                      context: context,
                                      message: StringManager.addSuccess.tr());
                                }
                              },
                              builder: (context, state) {
                                if (state is ProductInitial) {
                                  context.read<ProductBloc>().add(
                                      CategoryRequested(
                                          token:
                                              context.read<AuthBloc>().token ??
                                                  '',
                                          storeId: widget.storeId));
                                }
                                if (state is CategoryLoading) {
                                  return Lottie.asset(AssetJsonManager.loading,
                                      height: 100.h);
                                }

                                return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categoryModel
                                        ?.categoryDataModel?.category.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 50.w, end: 50.w),
                                          child: GestureDetector(
                                            onTap: () {
                                              searchController.clear();
                                              setState(() {
                                                selectdCategory = index;
                                              });
                                              productModel?.productDataModel
                                                  ?.clear();
                                              context.read<ProductBloc>().add(
                                                  ProductRequested(
                                                      search:
                                                          searchController.text,
                                                      token: context
                                                              .read<AuthBloc>()
                                                              .token ??
                                                          '',
                                                      storeId: widget.storeId,
                                                      categoryName: categoryModel
                                                                  ?.categoryDataModel
                                                                  ?.category[
                                                              selectdCategory] ??
                                                          '0'));
                                            },
                                            child: Text(
                                              categoryModel?.categoryDataModel
                                                      ?.category[index] ??
                                                  '',
                                              style: TextStyle(
                                                  color:
                                                      selectdCategory == index
                                                          ? ColorManager.black
                                                          : ColorManager.grey,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      selectdCategory == index
                                                          ? 45.sp
                                                          : 35.sp),
                                            ),
                                          ));
                                    });
                              },
                            ),
                          ),
                          Expanded(
                            child: BlocConsumer<ProductBloc, ProductState>(
                              listener: (context, state) {
                                if (state is ProductGetSuccess) {
                                  productModel = state.productModel;
                                }
                              },
                              builder: (context, state) {
                                if (state is ProductLoading) {
                                  return const LoadingWidget();
                                }
                                if (state is ProductGetSuccess &&
                                    state.productModel.productDataModel!
                                        .isEmpty) {
                                  EmptyWidget(
                                    height: 1.sh,
                                  );
                                }
                                return GridView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: 50.w, vertical: 30.h),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 40.h,
                                            mainAxisSpacing: 50.h,
                                            childAspectRatio: 1.3.h / 2.w,
                                            crossAxisCount: 2),
                                    itemCount: productModel
                                            ?.productDataModel?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            if (widget.categoryName ==
                                                    ConstManager
                                                        .clothesCategory ||
                                                widget.categoryName ==
                                                    ConstManager
                                                        .furnitureCategory) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ProductDetailsPage(
                                                            categoryName: widget
                                                                .categoryName,
                                                            productModel:
                                                                productModel,
                                                            index: index,
                                                          )));
                                            }
                                          },
                                          child: productCardWidget(
                                            index: index,
                                            productModel: productModel,
                                          ));
                                    });
                              },
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
