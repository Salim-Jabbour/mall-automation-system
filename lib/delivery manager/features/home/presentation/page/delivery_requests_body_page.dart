import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/widgets/empty_widget.dart';
import 'package:jessy_mall/core/widgets/loading_widget.dart';
import 'package:jessy_mall/delivery%20manager/features/home/models/delivery_order_model.dart';
import 'package:jessy_mall/delivery%20manager/features/home/presentation/bloc/delivery_manager_bloc/dilevery_manager_home_bloc.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';

import '../../../../../config/theme/color_manager.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../../../core/widgets/custom_card_movement_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import 'delivery_requests_details_page.dart';
import 'package:easy_localization/easy_localization.dart';

class DeliveryRequestBodyPage extends StatefulWidget {
  const DeliveryRequestBodyPage({super.key});

  @override
  State<DeliveryRequestBodyPage> createState() =>
      _DeliveryRequestBodyPageState();
}

class _DeliveryRequestBodyPageState extends State<DeliveryRequestBodyPage> {
  List<DeliveryDataOrderModel>? deliveryRequestsList;
  @override
  void dispose() {
    GetIt.I.get<DileveryManagerHomeBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<DileveryManagerHomeBloc>(),
      child: BlocConsumer<DileveryManagerHomeBloc, DileveryManagerHomeState>(
        listener: (context, state) {
          if (state is DileveryManagerGetOrderSuccess) {
            deliveryRequestsList = state.deliveryOrderModel.data!;
            // deliveryOrderList = state.deliveryOrderModel;

            print("i am in state is DileveryManagerGetOrderSuccess");
            print("${deliveryRequestsList?.length ?? 0}");
            // print("${deliveryOrderList!.data![0].id}");
          }
        },
        builder: (context, state) {
          // context.read<AuthBloc>().token
          if (state is DileveryManagerGetOrderFailed) {
            return FailuerWidget(
              errorMessage: state.faliuer.message,
              onPressed: () {
                //token: context.read<AuthBloc>().token
                context.read<DileveryManagerHomeBloc>().add(
                    DilevryGetOrderEvent(
                        token: context.read<AuthBloc>().token ?? ''));
              },
            );
          }
          if (state is DileveryManagerHomeInitial) {
            context.read<DileveryManagerHomeBloc>().add(
                DilevryGetOrderEvent(token: context.read<AuthBloc>().token!));
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
                            deliveryRequestsList?[index].from_who ?? "",
                        secondTextField:
                            deliveryRequestsList?[index].date ?? "",
                        quantityTextField:
                            deliveryRequestsList?[index].total_quantity ?? "",
                        fourthTextField:
                            "${StringManager.totalAmount.tr()}: ${deliveryRequestsList?[index].total_price ?? " "} ",
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
                                    builder: (context) => DeliveryDetailsPage(
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
                      ),
                    );
                  },
                ),
              ),
              if (state is DileveryManagerLoading)
                const LoadingWidget(
                  fullScreen: true,
                )
              else if (state is DileveryManagerGetOrderSuccess &&
                  deliveryRequestsList!.isEmpty)
                EmptyWidget(height: 1.sh)
            ],
          );
        },
      ),
    );
  }
}
