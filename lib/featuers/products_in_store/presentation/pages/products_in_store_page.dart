import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/profile/models/investor_model.dart';
import 'package:jessy_mall/featuers/profile/presentation/bloc/investor_bloc/bloc/investor_bloc.dart';

import '../../../../core/resource/string_manager.dart';
import '../../../../core/utils/global_snackbar.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/header_page.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../Auth/presintation/bloc/auth_bloc.dart';
import '../widgets/products_in_store_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductsInStorePage extends StatefulWidget {
  const ProductsInStorePage({super.key});

  @override
  State<ProductsInStorePage> createState() => _ProductsInStorePageState();
}

class _ProductsInStorePageState extends State<ProductsInStorePage> {
  List<InvestorDataProductModel> productsList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<InvestorBloc>(),
      child: Scaffold(
        body: BlocConsumer<InvestorBloc, InvestorState>(
          listener: (context, state) {
            if (state is InvestorGetProductSuccess) {
              productsList = state.investorProductModel.data!;
            }
            if (state is InvestorDeleteProductFromStoreFailure) {
              gShowErrorSnackBar(
                  context: context, message: state.failure.message);
            }
            if (state is InvestorDeleteProductFromStoreSuccess) {
              gShowSuccessSnackBar(
                  context: context, message: StringManager.deleteSuccess.tr());
            }
          },
          builder: (context, state) {
            if (state is InvestorInitial) {
              context.read<InvestorBloc>().add(
                  InvestorRequestProductFromMyStore(
                      token: context.read<AuthBloc>().token ?? ''));
            }
            if (state is InvestorGetProductFailuer) {
              return FailuerWidget(
                errorMessage: state.failure.message,
                onPressed: () {
                  context.read<InvestorBloc>().add(
                      InvestorRequestProductFromMyStore(
                          token: context.read<AuthBloc>().token ?? ''));
                },
              );
            }
            if (state is InvestorGetProductLoading) {
              return const LoadingWidget(
                fullScreen: true,
              );
            }

            return Column(
              children: [
                HeaderPage(
                  left: true,
                  title: StringManager.productsInStore.tr(),
                ),
                Expanded(
                  child: ListView.builder(
                    // itemCount: productsList.length,
                    itemCount: productsList.length,
                    padding: EdgeInsets.symmetric(
                      vertical: 50.h,
                      horizontal: 30.w,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(productsList[index].image);
                        },
                        child: Column(
                          children: [
                            ProductsInStoreWidget(
                              imageNetworkSource:
                                  productsList[index].image ?? '',
                              productName: productsList[index].name ?? '',
                              price: productsList[index].price.toString(),
                              quanitity:
                                  productsList[index].quantity.toString(),
                              productId: productsList[index].id.toString(),
                            ),
                            // index !=  productsList.length-1,
                            index < 7
                                ? SizedBox(width: 900.w, child: const Divider())
                                : const SizedBox.shrink()
                          ],
                        ),
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
