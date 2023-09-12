import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/widgets/custom_card_movement_widget.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../models/outcome_model.dart';
import '../bloc/warehouse_income_outcome_bloc.dart';

class OutcomeBody extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  OutcomeBody({super.key});

  @override
  State<OutcomeBody> createState() => _OutcomeBodyState();
}

class _OutcomeBodyState extends State<OutcomeBody> {
  List<OutcomeDataModel>? outcomeModelData;
  @override
  void dispose() {
    GetIt.I.get<WarehouseIncomeOutcomeBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WarehouseIncomeOutcomeBloc>(),
      child: Scaffold(
        body: BlocConsumer<WarehouseIncomeOutcomeBloc,
            WarehouseIncomeOutcomeState>(
          listener: (context, state) {
            if (state is WarehouseOutcomeGetDataSuccess) {
              outcomeModelData = state.outcomeModel.data;
            }
          },
          builder: (context, state) {
            if (state is WarehouseInitial) {
              context.read<WarehouseIncomeOutcomeBloc>().add(
                  OutcomeGetOutcomeDataEvent(
                      token: context.read<AuthBloc>().token ?? ''));
            }

            if (state is WarehouseOutcomeGetDataFailed) {
              return FailuerWidget(
                errorMessage: state.faliuer.message,
                onPressed: () {
                  //token: context.read<AuthBloc>().token
                  context.read<WarehouseIncomeOutcomeBloc>().add(
                      OutcomeGetOutcomeDataEvent(
                          token: context.read<AuthBloc>().token ?? ''));
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
                          itemCount: outcomeModelData?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                CustomCardMovementWidget(
                                  height: 350.h,
                                  firstTextField: outcomeModelData?[index]
                                          .warehouseProduct?[0]
                                          .name ??
                                      "product x",
                                  secondTextField:
                                      outcomeModelData?[index].outDate ??
                                          "20/08/2023",
                                  quantityTextField: outcomeModelData?[index]
                                          .quantityAfter
                                          .toString() ??
                                      "5000",
                                  fourthTextField:
                                      outcomeModelData?[index].warehouseStore ??
                                          "storreeeeee",
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
                if (state is WarehouseOutcomeLoading)
                  const LoadingWidget(fullScreen: true)
                else if (state is WarehouseOutcomeGetDataSuccess &&
                    outcomeModelData!.isEmpty)
                  EmptyWidget(height: 1.sh - 0.3.sh)
              ],
            );
          },
        ),
      ),
    );
  }
}
