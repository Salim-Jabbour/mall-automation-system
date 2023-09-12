import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/string_manager.dart';
import '../../../../core/utils/global_snackbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_card_movement_widget.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/header_page.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../../warehouse_home/presintation/pages/warehouse_home_page.dart';
import '../../models/warehouse_order_details_model.dart';
import '../bloc/warehouse_orders_bloc.dart';

// ignore: must_be_immutable
class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage({required this.deliveryOrderDetailId, super.key});
  final String deliveryOrderDetailId;

  List<WarehouseProduct>? detailsList;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WarehouseOrdersBloc>(),
      child: Scaffold(
        body: BlocConsumer<WarehouseOrdersBloc, WarehouseOrdersState>(
          listener: (context, state) {
            if (state is WarehouseOrderDetailsSuccess) {
              detailsList =
                  state.warehouseOrderDetailsModel.data?.warehouseProducts ??
                      [];
            }

            if (state is WarehouseConfirmSuccess) {
              gShowSuccessSnackBar(
                context: context,
                message: state.confirmMessage,
              );
            }
            if (state is WarehouseRejectSuccess) {
              gShowSuccessSnackBar(
                context: context,
                message: state.rejectMessage,
              );
            }
          },
          builder: (context, state) {
            if (state is WarehouseOrdersInitial) {
              context.read<WarehouseOrdersBloc>().add(GetPendingDetailsEvent(
                    token: context.read<AuthBloc>().token ?? '',
                    id: deliveryOrderDetailId,
                  ));
            }

            if (state is WarehouseOrdersFailed) {
              return FailuerWidget(
                errorMessage: state.failure.message,
                onPressed: () {
                  //token: context.read<AuthBloc>().token
                  context
                      .read<WarehouseOrdersBloc>()
                      .add(GetPendingDetailsEvent(
                        token: context.read<AuthBloc>().token ?? '',
                        id: deliveryOrderDetailId,
                      ));
                },
              );
            }
            return Stack(
              children: [
                Column(
                  children: [
                    HeaderPage(
                      title: StringManager.orderDetails.tr(),
                      left: true,
                    ),
                    // detailsList == null || detailsList!.isEmpty
                    //     ? EmptyWidget(height: 1.sh - 0.3.sh)
                    //     :

                    Expanded(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          ListView.builder(
                            itemCount: detailsList?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  CustomCardMovementWidget(
                                    height: 300.h,
                                    firstTextField:
                                        detailsList?[index].name ?? "Product X",
                                    secondTextField: StringManager.income.tr(),
                                    quantityTextField: detailsList?[index]
                                            .quantity
                                            .toString() ??
                                        "00",
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  )
                                ],
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 30.w, end: 30.w, bottom: 80.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomButton(
                                  onPressed: () {
                                    print("confirm");
                                    context.read<WarehouseOrdersBloc>().add(
                                        ConfirmEvent(
                                            token: context
                                                    .read<AuthBloc>()
                                                    .token ??
                                                '',
                                            id: deliveryOrderDetailId));

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const WarehouseHomePage()),
                                        (Route<dynamic> route) => false);
                                  },
                                  text: StringManager.confirm.tr(),
                                  width: 400.w,
                                  color: ColorManager.green,
                                ),
                                CustomButton(
                                  onPressed: () {
                                    print("Reject");
                                    context.read<WarehouseOrdersBloc>().add(
                                        RejectEvent(
                                            token: context
                                                    .read<AuthBloc>()
                                                    .token ??
                                                '',
                                            id: deliveryOrderDetailId));

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const WarehouseHomePage()),
                                        (Route<dynamic> route) => false);
                                  },
                                  text: StringManager.reject.tr(),
                                  width: 400.w,
                                  color: ColorManager.red,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (state is WarehouseOrdersLoading)
                  const LoadingWidget(fullScreen: true)
                else if (state is WarehouseOrderDetailsSuccess &&
                    detailsList!.isEmpty)
                  EmptyWidget(height: 1.sh - 0.3.sh)
              ],
            );
          },
        ),
      ),
    );
  }
}
