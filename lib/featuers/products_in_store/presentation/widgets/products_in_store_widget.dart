import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/theme/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/resource/asset_manager.dart';
import '../../../../core/utils/global_snackbar.dart';
import '../../../Auth/presintation/bloc/auth_bloc.dart';
import '../../../profile/presentation/bloc/investor_bloc/bloc/investor_bloc.dart';

class ProductsInStoreWidget extends StatelessWidget {
  const ProductsInStoreWidget({
    required this.imageNetworkSource,
    required this.productName,
    required this.price,
    required this.quanitity,
    required this.productId,
    super.key,
  });

  final String imageNetworkSource;
  final String productName;
  final String price;
  final String productId;

  final String quanitity;

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
            SizedBox(
              height: 230.h,
              child: Column(
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
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        '${StringManager.price.tr()} : ',
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF232323),
                          fontSize: 46.sp,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        price,
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: 46.sp,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${StringManager.quantity.tr()} : ',
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF232323),
                          fontSize: 46.sp,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        quanitity,
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: 46.sp,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 100.h,
              // TODO:must implement and put alert dialog
              child: BlocConsumer<InvestorBloc, InvestorState>(
                listener: (context, state) {
                
                },
                builder: (context, state) {
                  return  state is InvestorDeleteProductFromStoreLoading
                      ? LottieBuilder.asset(
                          AssetJsonManager.loading,
                          height: 75.h,
                        )
                      : IconButton(
                    onPressed: () {
                    context.read<InvestorBloc>().add(
                                InvestorDeleteProductFormMyStore(
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
