import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:jessy_mall/delivery%20manager/features/home/repository/delivery_home_repository.dart';

import '../../../../../../core/errors/base_error.dart';
import '../../../models/delivery_order_model.dart';

part 'dilevery_manager_home_event.dart';
part 'dilevery_manager_home_state.dart';

class DileveryManagerHomeBloc
    extends Bloc<DileveryManagerHomeEvent, DileveryManagerHomeState> {
  final DeliveryHomeRepository _deliveryHomeRepository;

  DileveryManagerHomeBloc(
    this._deliveryHomeRepository,
  ) : super(DileveryManagerHomeInitial()) {
    on<DilevryGetOrderEvent>((event, emit) async {
      emit(DileveryManagerLoading());
      final successOrFailuer =
          await _deliveryHomeRepository.getDeliveryOrders(token: event.token);
      successOrFailuer.fold((error) {
        emit(DileveryManagerGetOrderFailed(faliuer: error));
      }, (dileveryOrderModel) {
        emit(DileveryManagerGetOrderSuccess(
            deliveryOrderModel: dileveryOrderModel));
      });
    });
    on<DilevryPostApprovedStatuesOrderEvent>(
      (event, emit) async {
        emit(DileveryManagerLoading());
        final successOrFailuer =
            await _deliveryHomeRepository.postDeliveryOrdersApprovedStatues(
                id: event.id, token: event.token, statues: event.statues);

        successOrFailuer.fold((error) {
          emit(DilevryPostApprovedStatuesOrderFailed(faliuer: error));
        }, (msg) async {
          emit(DilevryPostApprovedStatuesOrderSuccess(msg: msg));
          
        });
      },
    );
    on<DilevryPostDeliverdStatuesOrderEvent>(
      (event, emit) async {
        emit(DileveryManagerLoading());
        final successOrFailuer =
            await _deliveryHomeRepository.postDeliveryOrdersDeliverdStatues(
                id: event.id, token: event.token, statues: event.statues);

        successOrFailuer.fold((error) {
          emit(DilevryPostDeliverdStatuesOrderFailed(faliuer: error));
        }, (msg) async {
          emit(DilevryPostDeliverdStatuesOrderSuccess(msg: msg));
        });
      },
    );

    on<DilevryGetPendingOrderEvent>((event, emit) async {
      emit(DileveryManagerLoading());
      final successOrFailuer = await _deliveryHomeRepository
          .getDeliveryPendingOrders(token: event.token);
      successOrFailuer.fold((error) {
        emit(DileveryManagerGetPendingOrderFailed(faliuer: error));
      }, (dileveryOrderModel) {
        emit(DileveryManagerGetPendingOrderSuccess(
            deliveryOrderModel: dileveryOrderModel));
      });
    });

    on<DilevryGetHistoryOrderEvent>((event, emit) async {
      emit(DileveryManagerLoading());
      final successOrFailuer = await _deliveryHomeRepository
          .getDeliveryHistoryOrders(token: event.token);
      successOrFailuer.fold((error) {
        emit(DileveryManagerGetHistoryOrderFailed(faliuer: error));
      }, (dileveryOrderModel) {
        emit(DileveryManagerGetHistoryOrderSuccess(
            deliveryOrderModel: dileveryOrderModel));
      });
    });
  }
}
