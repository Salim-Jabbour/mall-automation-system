import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';

import '../../../../core/resource/string_manager.dart';
import '../../../../core/widgets/custom_card_movement_widget.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../models/warehouse_order_model.dart';
import '../bloc/warehouse_orders_bloc.dart';
import 'order_details_page.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class OrderPendingBody extends StatefulWidget {
  const OrderPendingBody({super.key});

  @override
  State<OrderPendingBody> createState() => _OrderPendingBodyState();
}

class _OrderPendingBodyState extends State<OrderPendingBody> {
  List<WarehouseOrdersDataModel>? warehousePendingData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WarehouseOrdersBloc>(),
      child: Scaffold(
        body: BlocConsumer<WarehouseOrdersBloc, WarehouseOrdersState>(
          listener: (context, state) {
            if (state is WarehousePendingOrdersSuccess) {
              warehousePendingData = state.warehouseOrdersModel.data;
              print(warehousePendingData?.length ?? "SSSSSSSSSS");
            }
          },
          builder: (context, state) {
            if (state is WarehouseOrdersInitial) {
              context
                  .read<WarehouseOrdersBloc>()
                  .add(GetPendingEvent(context.read<AuthBloc>().token ?? ''));
            }
            if (state is WarehouseOrdersFailed) {
              return FailuerWidget(
                errorMessage: state.failure.message,
                onPressed: () {
                  //token: context.read<AuthBloc>().token
                  context.read<WarehouseOrdersBloc>().add(
                      GetPendingEvent(context.read<AuthBloc>().token ?? ''));
                },
              );
            }
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: warehousePendingData?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                CustomCardMovementWidget(
                                  height: 400.h,
                                  firstTextField: warehousePendingData?[index]
                                          .investor?[0]
                                          .name ??
                                      "Investor",
                                  secondTextField: warehousePendingData?[index]
                                          .requestDate ??
                                      "20/08/2023",
                                  quantityTextField:
                                      warehousePendingData?[index]
                                              .quantity
                                              .toString() ??
                                          "00",
                                  customWidget: Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 30.w, top: 20.h),
                                    child: SizedBox(
                                      height: 100.h,
                                      width: 300.w,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderDetailsPage(
                                                deliveryOrderDetailId:
                                                    warehousePendingData?[index]
                                                            .id
                                                            .toString() ??
                                                        "0",
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorManager.foregroundL,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                        ),
                                        child: Text(
                                          StringManager.details.tr(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
                if (state is WarehouseOrdersLoading)
                  const LoadingWidget(fullScreen: true)
                else if (state is WarehouseRejectSuccess &&
                    warehousePendingData!.isEmpty)
                  EmptyWidget(height: 1.sh)
              ],
            );
          },
        ),
      ),
    );
  }
}
