part of 'store_bloc.dart';

@immutable
class StoreEvent {}

class StoreRequested extends StoreEvent{
  String? search;
  String token;
  String type;
  StoreRequested({this.search, required this.token, required this.type});
}
