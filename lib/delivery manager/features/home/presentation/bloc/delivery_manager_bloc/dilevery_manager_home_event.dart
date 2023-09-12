part of 'dilevery_manager_home_bloc.dart';

@immutable
abstract class DileveryManagerHomeEvent {}

class DilevryGetOrderEvent extends DileveryManagerHomeEvent {
  final String token;
  DilevryGetOrderEvent({
    required this.token,
  });
}

class DilevryGetPendingOrderEvent extends DileveryManagerHomeEvent {
  final String token;
  DilevryGetPendingOrderEvent({
    required this.token,
  });
}

class DilevryGetHistoryOrderEvent extends DileveryManagerHomeEvent {
  final String token;
  DilevryGetHistoryOrderEvent({
    required this.token,
  });
}

class DilevryPostApprovedStatuesOrderEvent extends DileveryManagerHomeEvent {
  final String token;
  final int id;
  final String statues;
  DilevryPostApprovedStatuesOrderEvent({
    required this.token,
    required this.id,
    required this.statues,
  });
}

class DilevryPostDeliverdStatuesOrderEvent extends DileveryManagerHomeEvent {
  final String token;
  final int id;
  final int statues;
  DilevryPostDeliverdStatuesOrderEvent({
    required this.token,
    required this.id,
    required this.statues,
  });
}
