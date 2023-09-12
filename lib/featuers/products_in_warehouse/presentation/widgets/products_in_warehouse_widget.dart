import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/asset_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/utils/global_snackbar.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/profile/presentation/bloc/wearhouseInvestorbloc/bloc/wearhouse_investor_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/theme/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductsInWarehouseWidget extends StatelessWidget {
  const ProductsInWarehouseWidget({
    required this.imageNetworkSource,
    required this.productName,
    required this.quantity,
    required this.productId,
    super.key,
  });

  final String imageNetworkSource;
  final String productName;
  final String productId;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: 950.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox(
                height: 250.h,
                width: 250.h,
                child: Image.network(
                  imageNetworkSource,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 40.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFF808080),
                    fontSize: 38.sp,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Text(
                      '${StringManager.quantity.tr()} : ',
                      // textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF808080),
                        fontSize: 38.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      quantity.toString(),
                      // textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 38.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 100.h,
              child:
                  BlocConsumer<WearhouseInvestorBloc, WearhouseInvestorState>(
                listener: (context, state) {
                
                },
                builder: (context, state) {
                  return state is WearhouseInvestorDeleteProductLoading
                      ? LottieBuilder.asset(
                          AssetJsonManager.loading,
                          height: 75.h,
                        )
                      : IconButton(
                          onPressed: () {
                            context.read<WearhouseInvestorBloc>().add(
                                WearhouseInvestorDeleteProduct(
                                    token: context.read<AuthBloc>().token ?? '',
                                    productId: productId));
                          },
                          icon: Icon(
                            Icons.highlight_remove_outlined,
                            size: 60.r,
                            color: ColorManager.red,
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
