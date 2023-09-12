import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/utils/global_snackbar.dart';
import 'package:jessy_mall/core/widgets/custom_button.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/investment_options/models/investment_store_model.dart';
// import 'package:jessy_mall/featuers/investment_options/presentation/bloc/invest_option_bloc/invest_option_bloc.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/page/stripe_payment/payment_manager.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/widgets/slider_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../bloc/invest_option_bloc/invest_option_bloc.dart';
import 'check_paypal.dart';
import 'package:easy_localization/easy_localization.dart';

int? storeId;

class InvestStorePage extends StatelessWidget {
  const InvestStorePage({super.key, required this.investStoreDataModel});
  final InvestStoreDataModel investStoreDataModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 2300.h,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderPage(title: StringManager.details.tr(), left: true),
              //slider image with animation
              SliderImage(),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '${StringManager.type.tr()}  ${investStoreDataModel.type} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        // height: 28,
                        letterSpacing: 0.35,
                      ),
                    ),
                    //price
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 90,
                      child: Text(
                        '\$' "${investStoreDataModel.price}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF007AFF),
                          fontSize: 55.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          // height: 24,
                          letterSpacing: 0.38,
                        ),
                      ),
                    ),
                    //product details widget
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Store Details',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 55.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        // height: 24,
                        letterSpacing: 0.38,
                      ),
                    ),

                    SizedBox(
                      height: 8.h,
                    ),

                    Row(
                      children: [
                        Opacity(
                          opacity: 0.50,
                          child: Text(
                            '${StringManager.floor.tr()}\n${StringManager.storeSpace.tr()} \n${StringManager.dimensions.tr()} \n${StringManager.roomCount.tr()} ',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '${investStoreDataModel.floor}\n${investStoreDataModel.store_space}\n${investStoreDataModel.height} x ${investStoreDataModel.width} x ${investStoreDataModel.length} inches\n ${investStoreDataModel.roomCount}',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 40.sp,
                            fontFamily: 'SF Compact Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Text for store type with bold font
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                    onPressed: () async {
                      storeId = investStoreDataModel.id!;
                      await PaymentManager.makePayment(20, "USD");

                      if (storeId != 0) {
                        context.read<InvestOptionBloc>().add(InvestStoreEvent(
                            storeId: storeId!,
                            token: context.read<AuthBloc>().token!));
                        gShowSuccessSnackBar(
                            context: context,
                            message: StringManager.reservationIsDone.tr());
                      }
                      // Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => CheckoutPage(
                      //               id: "1",
                      //             )));
                    },
                    text: StringManager.invest.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * floor
 * dimentions
 * office ?
 * chacher ?
 * rooms
 * 
 */
/***************************** */
