part of 'warehouse_extra_space_requests_bloc.dart';

@immutable
abstract class WarehouseExtraSpaceRequestsEvent {}

class WarehouseGetSpaceRequestsEvent extends WarehouseExtraSpaceRequestsEvent {
  final String token;

  WarehouseGetSpaceRequestsEvent(this.token);
}

class WarehouseConfirmSpaceRequestEvent
    extends WarehouseExtraSpaceRequestsEvent {
  final String token, id;

  WarehouseConfirmSpaceRequestEvent({required this.token, required this.id});
}

class WarehouseRejectSpaceRequestEvent
    extends WarehouseExtraSpaceRequestsEvent {
  final String token, id;

  WarehouseRejectSpaceRequestEvent({required this.token, required this.id});
}
