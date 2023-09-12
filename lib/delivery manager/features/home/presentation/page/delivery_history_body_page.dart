import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/delivery%20manager/features/home/presentation/bloc/delivery_manager_bloc/dilevery_manager_home_bloc.dart';

import '../../../../../config/theme/color_manager.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../../../core/widgets/custom_card_movement_widget.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../models/delivery_order_model.dart';
import 'package:easy_localization/easy_localization.dart';

import 'delivery_history_details_page.dart';

class DeliveryHistoryBodyPage extends StatefulWidget {
  const DeliveryHistoryBodyPage({super.key});

  @override
  State<DeliveryHistoryBodyPage> createState() =>
      _DeliveryHistoryBodyPageState();
}

class _DeliveryHistoryBodyPageState extends State<DeliveryHistoryBodyPage> {
  List<DeliveryDataOrderModel>? deliveryRequestsList;

  bool? isDelivered;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<DileveryManagerHomeBloc>(),
      child: BlocConsumer<DileveryManagerHomeBloc, DileveryManagerHomeState>(
        listener: (context, state) {
          

          if (state is DileveryManagerGetHistoryOrderSuccess) {
            deliveryRequestsList = state.deliveryOrderModel.data!;
            print("i am in state is DileveryManagerGetHistoryOrderSuccess");
            print("${deliveryRequestsList?.length ?? 0}");
          }
        },
        builder: (context, state) {
          if (state is DileveryManagerGetHistoryOrderFailed) {
            return FailuerWidget(
              errorMessage: state.faliuer.message,
              onPressed: () {
                //token: context.read<AuthBloc>().token
                context.read<DileveryManagerHomeBloc>().add(
                    DilevryGetHistoryOrderEvent(
                        token: context.read<AuthBloc>().token ?? ''));
              },
            );
          }
          if (state is DileveryManagerHomeInitial) {
            context.read<DileveryManagerHomeBloc>().add(
                DilevryGetHistoryOrderEvent(
                    token: context.read<AuthBloc>().token!));
          }
          return Stack(
            children: [
              SizedBox(
                height: 2000.h,
                child: ListView.builder(
                  // itemCount: deliveryRequestsList.length,
                  itemCount: deliveryRequestsList?.length ?? 0,
                  padding: EdgeInsets.symmetric(
                    vertical: 50.h,
                    horizontal: 30.w,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: CustomCardMovementWidget(
                        height: 400.h,
                        firstTextField:
                            deliveryRequestsList?[index].from_who ?? "Salimo",
                        secondTextField:
                            deliveryRequestsList?[index].date ?? "20/03/2020",
                        quantityTextField:
                            deliveryRequestsList?[index].total_quantity ?? "0",
                        fourthTextField:
                            "${StringManager.totalAmount.tr()}: ${deliveryRequestsList?[index].total_price ?? "0.0"}",
                        customWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
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
                                            HistoryDetailsPage(
                                          deliveryDataOrderModel:
                                              deliveryRequestsList?[index],
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorManager.foregroundL,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r),
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
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  end: 30.w, top: 20.h),
                              child: Text(
                                deliveryRequestsList?[index].delivered_status ==
                                        1
                                    ? StringManager.delivered.tr()
                                    : StringManager.failed.tr(),
                                style: TextStyle(
                                  color: deliveryRequestsList?[index]
                                              .delivered_status ==
                                          1
                                      ? ColorManager.green
                                      : ColorManager.red,
                                  fontSize: 38.sp,
                                  fontFamily: 'Nunito Sans',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (state is DileveryManagerLoading)
                const LoadingWidget(
                  fullScreen: true,
                )
              else if (state is DileveryManagerGetHistoryOrderSuccess &&
                  deliveryRequestsList!.isEmpty)
                EmptyWidget(height: 1.sh)
            ],
          );
        },
      ),
    );
  }
}
