part of 'dilevery_manager_home_bloc.dart';

@immutable
abstract class DileveryManagerHomeState {}

class DileveryManagerHomeInitial extends DileveryManagerHomeState {}

class DileveryManagerLoading extends DileveryManagerHomeState {}

class DileveryManagerGetOrderFailed extends DileveryManagerHomeState {
  final Failure faliuer;
  DileveryManagerGetOrderFailed({
    required this.faliuer,
  });
}

class DileveryManagerGetOrderSuccess extends DileveryManagerHomeState {
  final DeliveryOrderModel deliveryOrderModel;
  DileveryManagerGetOrderSuccess({
    required this.deliveryOrderModel,
  });
}

class DilevryPostApprovedStatuesOrderSuccess extends DileveryManagerHomeState {
  final String msg;
  DilevryPostApprovedStatuesOrderSuccess({
    required this.msg,
  });
}

class DilevryPostApprovedStatuesOrderFailed extends DileveryManagerHomeState {
  final Failure faliuer;
  DilevryPostApprovedStatuesOrderFailed({
    required this.faliuer,
  });
}

class DilevryPostDeliverdStatuesOrderSuccess extends DileveryManagerHomeState {
  final String msg;
  DilevryPostDeliverdStatuesOrderSuccess({
    required this.msg,
  });
}

class DilevryPostDeliverdStatuesOrderFailed extends DileveryManagerHomeState {
  final Failure faliuer;
  DilevryPostDeliverdStatuesOrderFailed({
    required this.faliuer,
  });
}

class DileveryManagerGetPendingOrderFailed extends DileveryManagerHomeState {
  final Failure faliuer;
  DileveryManagerGetPendingOrderFailed({
    required this.faliuer,
  });
}

class DileveryManagerGetPendingOrderSuccess extends DileveryManagerHomeState {
  final DeliveryOrderModel deliveryOrderModel;
  DileveryManagerGetPendingOrderSuccess({
    required this.deliveryOrderModel,
  });
}

class DileveryManagerGetHistoryOrderFailed extends DileveryManagerHomeState {
  final Failure faliuer;
  DileveryManagerGetHistoryOrderFailed({
    required this.faliuer,
  });
}

class DileveryManagerGetHistoryOrderSuccess extends DileveryManagerHomeState {
  final DeliveryOrderModel deliveryOrderModel;
  DileveryManagerGetHistoryOrderSuccess({
    required this.deliveryOrderModel,
  });
}
