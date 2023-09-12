import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';

import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/custom_button.dart';
import 'package:jessy_mall/core/widgets/custom_counter.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:jessy_mall/featuers/cart/presentation/widgets/cart_card.dart';
import 'package:jessy_mall/featuers/cart/presentation/widgets/shipping_address_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/utils/global_snackbar.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../Auth/presintation/bloc/auth_bloc.dart';
import '../../models/cart_model.dart';
import '../bloc/cart_bloc/cart_bloc.dart';

String addressLocation = "call my phone";

class MyCartBody extends StatefulWidget {
  MyCartBody({super.key});

  @override
  State<MyCartBody> createState() => _MyCartBodyState();
}

class _MyCartBodyState extends State<MyCartBody> {
  CartModel? cartResponseModel;

  num totalPrice = 0;

  String cartOrderIds = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CartGetAllOrderSuccess) {
            totalPrice = 0;

            cartOrderIds = "";

            cartResponseModel = state.cartModel;
            print("CartGetAllOrderSuccess");
            //for loop for total price
            for (int i = 0;
                i < cartResponseModel!.data!.cart_orders!.length;
                i++) {
              double singlePriceWithQuantity = cartResponseModel!
                      .data!.cart_orders![i].storeProduct!.price! *
                  cartResponseModel!.data!.cart_orders![i].quantity!.toDouble();
              totalPrice += singlePriceWithQuantity;
              print(totalPrice);
            }
            //for loop for cartOrderIds

            for (int i = 0;
                i < cartResponseModel!.data!.cart_orders!.length;
                i++) {
              String tempCartOrderIds =
                  "${cartResponseModel!.data!.cart_orders![i].id},";

              cartOrderIds = "$cartOrderIds$tempCartOrderIds";
              print(cartOrderIds);
            }
            if (cartOrderIds != null && cartOrderIds.length > 0) {
              cartOrderIds = cartOrderIds.substring(0, cartOrderIds.length - 1);
            }
            // cartOrderIds = cartOrderIds.substring(cartOrderIds.length - 1);
            print("FINAL cartOrderIds" + cartOrderIds);
          }

          if (state is CartRemoveOrderSuccess) {
            gShowSuccessSnackBar(
                context: context,
                message: StringManager.removedSuccessfully.tr());
          }
        },
        builder: (context, state) {
          if (state is CartInitial) {
            context.read<CartBloc>().add(CartGetAllOrderEvent(
                token: context.read<AuthBloc>().token ?? ''));
            print("initial");
          }
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderPage(left: false, title: StringManager.myCart.tr()),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 20.w, end: 20.w, bottom: 30.h),
                    child: Text(
                      StringManager.shippingAddress.tr(),
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 45.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ShippingAddressCard(
                      homeText: StringManager.home.tr(), addressText: null),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      StringManager.orderList.tr(),
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 45.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      // alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                cartResponseModel?.data?.cart_orders?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              return CartCard(
                                price:
                                    "\$ ${cartResponseModel?.data!.cart_orders?[index].storeProduct?.price ?? 0}",
                                delete: true,
                                image: cartResponseModel
                                        ?.data!
                                        .cart_orders?[index]
                                        .storeProduct
                                        ?.image ??
                                    "",
                                name: cartResponseModel
                                        ?.data!
                                        .cart_orders?[index]
                                        .storeProduct
                                        ?.name ??
                                    "Product Name",
                                id: cartResponseModel
                                    ?.data!.cart_orders?[index].id,
                                quantity: cartResponseModel
                                        ?.data?.cart_orders?[index].quantity
                                        .toString() ??
                                    "0",
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 330.h,
                          color: ColorManager.backgroundL,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringManager.total.tr(),
                                    style: TextStyle(
                                      color: Color(0xFF808080),
                                      fontSize: 55.sp,
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '\$ ${totalPrice}',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 55.sp,
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              if (cartResponseModel?.data == null ||
                                  cartResponseModel!.data!.cart_orders!.isEmpty)
                                SizedBox()
                              else
                                CustomButton(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(CartPostBuyAllOrderEvent(
                                          token:
                                              context.read<AuthBloc>().token ??
                                                  " ",
                                          cartOrderIds: cartOrderIds,
                                          addressLocation: addressLocation,
                                        ));
                                  },
                                  text: StringManager.confirm.tr(),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              if (state is CartLoading)
                const LoadingWidget(
                  fullScreen: true,
                ),
            ],
          );
        },
      ),
    );
  }
}
