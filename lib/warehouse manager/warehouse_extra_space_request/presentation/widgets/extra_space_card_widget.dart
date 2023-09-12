import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_extra_space_request/presentation/widgets/warehouse_confirm_reject_button_widget.dart';

import '../../../../core/resource/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/global_snackbar.dart';
import '../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../bloc/warehouse_extra_space_requests_bloc.dart';

class WarehouseExtraSpaceCardWidget extends StatelessWidget {
  const WarehouseExtraSpaceCardWidget({
    required this.userNameText,
    required this.dateText,
    required this.priceText,
    required this.id,
    super.key,
  });
  final String userNameText, dateText, priceText, id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WarehouseExtraSpaceRequestsBloc,
        WarehouseExtraSpaceRequestsState>(
      listener: (context, state) {
        if (state is WarehouseExtraSpaceRequestsFailed) {
          gShowErrorSnackBar(
            context: context,
            message: "Failed",
          );
        }

        if (state is WarehouseExtraSpaceConfirmRequest) {
          gShowSuccessSnackBar(
            context: context,
            message: state.confirmMessage,
          );
        
        
        }

        if (state is WarehouseExtraSpaceRejectRequest) {
          gShowSuccessSnackBar(
            context: context,
            message: state.rejectMessage,
          );

        }
      },
      builder: (context, state) {
        return Container(
          width: 950.w,
          height: 450.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: const [
              BoxShadow(
                color: Color(0x338A959E),
                blurRadius: 40,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userNameText,
                      style: TextStyle(
                        color: const Color(0xFF232323),
                        fontSize: 46.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      dateText,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF808080),
                        fontSize: 38.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${StringManager.extraSpace.tr()}: ",
                          style: TextStyle(
                            color: const Color(0xFF808080),
                            fontSize: 46.sp,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$priceText ${StringManager.meter.tr()}",
                          style: TextStyle(
                            color: const Color(0xFF232323),
                            fontSize: 46.sp,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SizedBox(
                  width: 980.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WarehouseConfirmOrRejectButtonWidget(
                        height: 150.h,
                        width: 450.w,
                        isConfirm: true,
                        onpressed: () {
                          print("confirm");
                          context
                              .read<WarehouseExtraSpaceRequestsBloc>()
                              .add(WarehouseConfirmSpaceRequestEvent(
                                token: context.read<AuthBloc>().token ?? '',
                                id: id,
                              ));
                        },
                      ),
                      WarehouseConfirmOrRejectButtonWidget(
                        height: 150.h,
                        width: 450.w,
                        isConfirm: false,
                        onpressed: () {
                          print("reject");
                          context
                              .read<WarehouseExtraSpaceRequestsBloc>()
                              .add(WarehouseRejectSpaceRequestEvent(
                                token: context.read<AuthBloc>().token ?? '',
                                id: id,
                              ));
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
