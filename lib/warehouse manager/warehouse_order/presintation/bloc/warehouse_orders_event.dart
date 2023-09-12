part of 'warehouse_orders_bloc.dart';

@immutable
abstract class WarehouseOrdersEvent {}

class GetPendingEvent extends WarehouseOrdersEvent {
  final String token;

  GetPendingEvent(this.token);
}

class GetApprovedEvent extends WarehouseOrdersEvent {
  final String token;

  GetApprovedEvent(this.token);
}

class GetRejectedEvent extends WarehouseOrdersEvent {
  final String token;

  GetRejectedEvent(this.token);
}

class GetPendingDetailsEvent extends WarehouseOrdersEvent {
  final String token, id;

  GetPendingDetailsEvent({required this.token, required this.id});
}

class ConfirmEvent extends WarehouseOrdersEvent {
  final String token, id;

  ConfirmEvent({required this.token, required this.id});
}

class RejectEvent extends WarehouseOrdersEvent {
  final String token, id;

  RejectEvent({required this.token, required this.id});
}
