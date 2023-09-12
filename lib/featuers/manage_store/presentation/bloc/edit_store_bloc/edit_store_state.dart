part of 'edit_store_bloc.dart';

@immutable
abstract class EditStoreState {}

class EditStoreInitial extends EditStoreState {}

class EditStoreloading extends EditStoreState {}

class EditStoreSuccess extends EditStoreState {
  final StoreModel storeModel;

  EditStoreSuccess({required this.storeModel});
}

class EditStoreFailed extends EditStoreState {
  final Failure faliuer;
  EditStoreFailed({required this.faliuer});
}

class UpdateStoreSuccess extends EditStoreState {
  final StoreModel storeModelUpdated;

  UpdateStoreSuccess({required this.storeModelUpdated});
}
