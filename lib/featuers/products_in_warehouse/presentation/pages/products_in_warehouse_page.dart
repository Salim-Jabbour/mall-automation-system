import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/utils/global_snackbar.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/profile/models/wearhouse_investor_product.dart';
import 'package:jessy_mall/featuers/profile/presentation/bloc/wearhouseInvestorbloc/bloc/wearhouse_investor_bloc.dart';

import '../../../../core/resource/string_manager.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/header_page.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../widgets/products_in_warehouse_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductsInWarehousePage extends StatefulWidget {
  const ProductsInWarehousePage({super.key});

  @override
  State<ProductsInWarehousePage> createState() =>
      _ProductsInWarehousePageState();
}

class _ProductsInWarehousePageState extends State<ProductsInWarehousePage> {
  List<WearhouseInvestorProductDataModel>? productsList;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WearhouseInvestorBloc>(),
      child: Scaffold(
        body: BlocConsumer<WearhouseInvestorBloc, WearhouseInvestorState>(
          listener: (context, state) {
            if (state is WearhouseInvestorGetDataSuccess) {
              productsList = state.wearhouseInvestorProductModel.data;
            }
            if (state is WearhouseInvestorDeleteProductFailure) {
              gShowErrorSnackBar(
                  context: context, message: state.failure.message);
            }
            if (state is WearhouseInvestorDeleteProductSuccess) {
              gShowSuccessSnackBar(
                  context: context, message: StringManager.deleteSuccess.tr());
            }
          },
          builder: (context, state) {
            if (state is WearhouseInvestorGetDataFailure) {
              return FailuerWidget(
                errorMessage: state.failure.message,
                onPressed: () {
                  context.read<WearhouseInvestorBloc>().add(
                      WearhouseInvestorRequestData(
                          token: context.read<AuthBloc>().token ?? ''));
                },
              );
            }
            if (state is WearhouseInvestorInitial) {
              context.read<WearhouseInvestorBloc>().add(
                  WearhouseInvestorRequestData(
                      token: context.read<AuthBloc>().token ?? ''));
            }
            if (state is WearhouseInvestorGetDataLoading) {
              return const LoadingWidget(
                fullScreen: true,
              );
            }
            return Column(
              children: [
                HeaderPage(
                  left: true,
                  title: StringManager.productsInWarehouse.tr(),
                ),
                productsList == null
                    ? EmptyWidget(
                        height: 0.5.sh,
                      )
                    : Expanded(
                        child: ListView.builder(
                          // itemCount: productsList.length,
                          itemCount: productsList?.length,
                          padding: EdgeInsets.symmetric(
                            vertical: 50.h,
                            horizontal: 30.w,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ProductsInWarehouseWidget(
                                  imageNetworkSource:
                                      productsList?[index].image ?? '',
                                  productName: productsList?[index].name ?? '',
                                  quantity: productsList?[index].quantity ?? 0,
                                  productId:
                                      productsList?[index].id.toString() ?? '',
                                ),
                                index < productsList!.length - 1
                                    ? SizedBox(
                                        width: 900.w, child: const Divider())
                                    : const SizedBox.shrink()
                              ],
                            );
                          },
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
