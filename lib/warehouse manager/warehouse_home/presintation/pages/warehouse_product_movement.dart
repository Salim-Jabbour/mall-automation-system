import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:jessy_mall/core/widgets/header_page.dart';

import '../../../../core/resource/string_manager.dart';
import '../../../../core/widgets/custom_card_movement_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../models/product_details_model.dart';
import '../bloc/warehouse_homepage_products_bloc.dart';

// ignore: must_be_immutable
class WareHouseProductMovementPage extends StatelessWidget {
  WareHouseProductMovementPage({
    required this.productName,
    required this.storeName,
    required this.productId,
    super.key,
  });

  final String productId, productName, storeName;

  List<WarehouseIn>? warehouseInData;
  List<WarehouseOut>? warehouseOutData;

  int incomeFlex = 1;
  int outcomeFlex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WarehouseHomepageProductsBloc>(),
      child: Scaffold(
        body: BlocConsumer<WarehouseHomepageProductsBloc,
            WarehouseHomepageProductsState>(
          listener: (context, state) {
            if (state is WarehouseHomepageProductsDetailsSuccess) {
              warehouseInData =
                  state.warehouseProductDetailsModel.data?.ins ?? [];
              warehouseOutData =
                  state.warehouseProductDetailsModel.data?.outs ?? [];
              int x = warehouseInData?.length ?? 1;
              int y = warehouseOutData?.length ?? 1;
              incomeFlex = x;
              outcomeFlex = y;

              print(incomeFlex);
              print("$outcomeFlex       aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            }
          },
          builder: (context, state) {
            if (state is WarehouseHomepageProductsInitial) {
              context.read<WarehouseHomepageProductsBloc>().add(
                    WarehouseHomePageGetProductDetailsEvent(
                      productId: productId,
                      token: context.read<AuthBloc>().token ?? '',
                    ),
                  );
            }
            if (state is WarehouseHomepageProductsFailed) {
              return FailuerWidget(
                errorMessage: state.failure.message,
                onPressed: () {
                  //token: context.read<AuthBloc>().token
                  context.read<WarehouseHomepageProductsBloc>().add(
                        WarehouseHomePageGetProductDetailsEvent(
                            productId: productId,
                            token: context.read<AuthBloc>().token ?? ''),
                      );
                },
              );
            }
            return Stack(
              children: [
                incomeFlex == 0
                    ? EmptyWidget(
                        height: 1.sh,
                      )
                    : Column(
                        children: [
                          HeaderPage(
                            title: StringManager.productMovement.tr(),
                            left: true,
                          ),

                          SizedBox(
                            width: 1.sw,
                            child: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 70.w,
                              ),
                              child: Text(
                                "${StringManager.income.tr()}:",
                                // textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Color(0xFF232323),
                                  fontSize: 16,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          //incomes
                          Expanded(
                            flex: incomeFlex,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: warehouseInData?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      //incomes
                                      CustomCardMovementWidget(
                                        height: 350.h,
                                        firstTextField: productName,
                                        secondTextField:
                                            StringManager.income.tr(),
                                        quantityTextField:
                                            warehouseInData?[index]
                                                    .quantity
                                                    .toString() ??
                                                "00",
                                        fourthTextField:
                                            warehouseInData?[index].inDate ??
                                                "20/08/2023",
                                        customWidget: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.w),
                                          child: Text(
                                            storeName,
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: Color(0xFF232323),
                                              fontSize: 16,
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                    ],
                                  );
                                }),
                          ),

                          SizedBox(
                            width: 1000.w,
                            child: const Divider(),
                          ),

                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            width: 1.sw,
                            child: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 70.w),
                              child: Text(
                                "${StringManager.outcome.tr()}:",
                                style: const TextStyle(
                                  color: Color(0xFF232323),
                                  fontSize: 16,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),

                          //outcomes
                          Expanded(
                            flex: outcomeFlex,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: warehouseOutData?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      CustomCardMovementWidget(
                                        height: 350.h,
                                        firstTextField: productName,
                                        secondTextField:
                                            StringManager.outcome.tr(),
                                        quantityTextField:
                                            warehouseOutData?[index]
                                                    .quantity
                                                    .toString() ??
                                                "00",
                                        fourthTextField:
                                            warehouseOutData?[index].outDate ??
                                                "22/08/2023",
                                        customWidget: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.w),
                                          child: Text(
                                            storeName,
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: Color(0xFF232323),
                                              fontSize: 16,
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                if (state is WarehouseHomepageProductsDetailsLoading)
                  const LoadingWidget(fullScreen: true),
              ],
            );
          },
        ),
      ),
    );
  }
}
