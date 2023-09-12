part of 'store_bloc.dart';

@immutable
class StoreState {}

class StoreInitial extends StoreState {}

class StoreGetInfoSuccess extends StoreState {
  StoreModel storeModel;
  StoreGetInfoSuccess({required this.storeModel});
}
class StoreLoading extends StoreState {}

class StoreGetInfoFailed extends StoreState {
  final Failure faliuer;
  StoreGetInfoFailed({required this.faliuer});
}
