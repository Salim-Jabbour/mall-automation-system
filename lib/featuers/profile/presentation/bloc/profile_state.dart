//TODO might be 2 states for every button and event

part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileGetInfoFailed extends ProfileState {
  final Failure faliuer;
  ProfileGetInfoFailed({required this.faliuer});
}

class ProfileGetInfoSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileGetInfoSuccess({required this.profileModel});
}

class ProfileOrderLoaded extends ProfileState {
  //TODO: order model
}

class ProfileShippingAdressesLoaded extends ProfileState {
  //TODO: shipping addresses model
}

class ProfileInvestStoreOrStandLoaded extends ProfileState {
  //TODO: Investstore or stand model
}

class ProfileSettingsLoaded extends ProfileState {
  //TODO: Settings model
}

class ProfileManageMyStoresLoaded extends ProfileState {
  //TODO: manage my store model
}
