part of 'warehouse_extra_space_requests_bloc.dart';

@immutable
abstract class WarehouseExtraSpaceRequestsState {}

class WarehouseExtraSpaceRequestsInitial
    extends WarehouseExtraSpaceRequestsState {}

class WarehouseExtraSpaceRequestsLoading
    extends WarehouseExtraSpaceRequestsState {}

class WarehouseExtraSpaceRequestsFailed
    extends WarehouseExtraSpaceRequestsState {
  final Failure failure;

  WarehouseExtraSpaceRequestsFailed({required this.failure});
}

class WarehouseExtraSpaceRequestsSuccess
    extends WarehouseExtraSpaceRequestsState {
  final WarehouseExtraSpaceRequestsModel warehouseExtraSpaceRequestsModel;

  WarehouseExtraSpaceRequestsSuccess(
      {required this.warehouseExtraSpaceRequestsModel});
}


class WarehouseExtraSpaceConfirmRequest extends WarehouseExtraSpaceRequestsState{
  final String confirmMessage;

  WarehouseExtraSpaceConfirmRequest(this.confirmMessage);
}


class WarehouseExtraSpaceRejectRequest extends WarehouseExtraSpaceRequestsState{
  final String rejectMessage;

  WarehouseExtraSpaceRejectRequest(this.rejectMessage);
}