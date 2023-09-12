import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../models/warehouse_extra_space_requests_model.dart';
import '../bloc/warehouse_extra_space_requests_bloc.dart';
import '../widgets/extra_space_card_widget.dart';

class WarehouseExtraSpaceRequests extends StatefulWidget {
  const WarehouseExtraSpaceRequests({super.key});

  @override
  State<WarehouseExtraSpaceRequests> createState() =>
      _WarehouseExtraSpaceRequestsState();
}

class _WarehouseExtraSpaceRequestsState
    extends State<WarehouseExtraSpaceRequests> {
  List<DataItem>? warehouseModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WarehouseExtraSpaceRequestsBloc>(),
      child: Scaffold(
        body: BlocConsumer<WarehouseExtraSpaceRequestsBloc,
            WarehouseExtraSpaceRequestsState>(
          listener: (context, state) {
            if (state is WarehouseExtraSpaceRequestsSuccess) {
              warehouseModel = state.warehouseExtraSpaceRequestsModel.data;
              print(warehouseModel?.length ?? 00000000000000000000);
            }
          },
          builder: (context, state) {
            if (state is WarehouseExtraSpaceRequestsInitial) {
              context.read<WarehouseExtraSpaceRequestsBloc>().add(
                  WarehouseGetSpaceRequestsEvent(
                      context.read<AuthBloc>().token ?? ''));
            }

            if (state is WarehouseExtraSpaceRequestsFailed) {
              return FailuerWidget(
                errorMessage: state.failure.message,
                onPressed: () {
                  //token: context.read<AuthBloc>().token
                  context.read<WarehouseExtraSpaceRequestsBloc>().add(
                      WarehouseGetSpaceRequestsEvent(
                          context.read<AuthBloc>().token ?? ''));
                },
              );
            }
            return Stack(
              children: [
                Column(
                  children: [
                    HeaderPage(
                      title: StringManager.extraSpaceRequest.tr(),
                      left: true,
                    ),
                    SizedBox(
                      height: 2000.h,
                      child: ListView.builder(
                          itemCount: warehouseModel?.length ?? 0,
                          padding: EdgeInsets.symmetric(
                            vertical: 50.h,
                            horizontal: 30.w,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 30.h),
                              child: warehouseModel?[index]
                                          .warehouseManagerApproval ==
                                      "pending"
                                  ? WarehouseExtraSpaceCardWidget(
                                      id: warehouseModel?[index]
                                              .id
                                              .toString() ??
                                          "1",
                                      userNameText:
                                          warehouseModel?[index].user[0].name ??
                                              "JESSY",
                                      dateText: "20/03/2023",
                                      priceText: warehouseModel?[index]
                                              .newSpace
                                              .toString() ??
                                          "50",
                                    )
                                  : const SizedBox.shrink(),
                            );
                          }),
                    ),
                  ],
                ),
                if (state is WarehouseExtraSpaceRequestsLoading)
                  const LoadingWidget(fullScreen: true)
                else if (state is WarehouseExtraSpaceRequestsSuccess &&
                    warehouseModel!.isEmpty)
                  EmptyWidget(height: 1.sh - 0.3)
              ],
            );
          },
        ),
      ),
    );
  }
}
