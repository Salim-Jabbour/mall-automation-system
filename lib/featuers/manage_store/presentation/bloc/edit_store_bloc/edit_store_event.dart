part of 'edit_store_bloc.dart';

@immutable
abstract class EditStoreEvent {}

class GetEditStoreEvent extends EditStoreEvent {
  final String token;
  GetEditStoreEvent({required this.token});
}

class UpdateEditStoreEvent extends EditStoreEvent {
  // final File image;
  final int id;
  final String token;
  final String name_ar;
  final String name_en;
  final String openTime;
  final String closeTime;
  UpdateEditStoreEvent({
    required this.id,
    required this.token,
    required this.name_ar,
    required this.name_en,
    required this.openTime,
    required this.closeTime,
  });
}
