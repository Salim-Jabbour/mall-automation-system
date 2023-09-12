import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_home/models/product_model.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_home/presintation/pages/warehouse_product_movement.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../bloc/warehouse_homepage_products_bloc.dart';

// ignore: must_be_immutable
class WarehouseProductBody extends StatefulWidget {
  WarehouseProductBody({super.key});

  @override
  State<WarehouseProductBody> createState() => _WarehouseProductBodyState();
}

class _WarehouseProductBodyState extends State<WarehouseProductBody> {
  List<ProductDataModel>? productsList;

  @override
  void dispose() {
    GetIt.I.get<WarehouseHomepageProductsBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WarehouseHomepageProductsBloc>(),
      child: Scaffold(
        body: BlocConsumer<WarehouseHomepageProductsBloc,
            WarehouseHomepageProductsState>(
          listener: (context, state) {
            if (state is WarehouseHomepageProductsSuccess) {
              productsList = state.warehouseProductModel.data;
              print("${productsList?.length ?? "AAAAA"} ssssssssssssssssss");
            }
          },
          builder: (context, state) {
            if (state is WarehouseHomepageProductsInitial) {
              context.read<WarehouseHomepageProductsBloc>().add(
                  WarehouseHomePageGetProductsEvent(
                      token: context.read<AuthBloc>().token ?? ''));
            }
            if (state is WarehouseHomepageProductsFailed) {
              return FailuerWidget(
                errorMessage: state.failure.message,
                onPressed: () {
                  //token: context.read<AuthBloc>().token
                  context.read<WarehouseHomepageProductsBloc>().add(
                      WarehouseHomePageGetProductsEvent(
                          token: context.read<AuthBloc>().token ?? ''));
                },
              );
            }
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 50.w, vertical: 30.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 40.h,
                          mainAxisSpacing: 50.h,
                          // mainAxisExtent: 100.h,
                          childAspectRatio: 1.3.h / 2.w,
                          crossAxisCount: 2,
                        ),
                        itemCount: productsList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ProductCardInWarehouse(
                            productId: productsList?[index].id ?? 0,
                            productName:
                                productsList?[index].name ?? "product X",
                            storeName:
                                productsList?[index].store?.name ?? "Store Y",
                            imageUrl: productsList?[index].image ??
                                "https://i.ytimg.com/vi/ghb6eDopW8I/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCoNyV-ShyxkGZ4gUEsjzvYeYcrKg",
                          );
                        },
                      ),
                    ),
                  ],
                ),
                if (state is WarehouseHomepageProductsLoading)
                  const LoadingWidget(fullScreen: true)
                else if (state is WarehouseHomepageProductsSuccess &&
                    (productsList == null || productsList!.isEmpty))
                  EmptyWidget(height: 1.sh - 0.3.sh)
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProductCardInWarehouse extends StatelessWidget {
  const ProductCardInWarehouse({
    required this.productId,
    required this.imageUrl,
    required this.productName,
    required this.storeName,
    super.key,
  });
  final int productId;
  final String imageUrl, productName, storeName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WareHouseProductMovementPage(
              productName: productName,
              productId: productId.toString(),
              storeName: storeName,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorManager.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.vertical(top: Radius.circular(50.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Image.network(
                imageUrl,
                height: 600.h,
                width: 1.sw,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    storeName,
                    style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
