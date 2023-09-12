part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileGetProfileInfoEvent extends ProfileEvent {
  final String token;

  ProfileGetProfileInfoEvent({required this.token});
}

// class ProfileMyOrdersEvent extends ProfileEvent {}

// class ProfileShippingAddressesEvent extends ProfileEvent {}

// class ProfileInvestStoreOrStandEvent extends ProfileEvent {}

// class ProfileSettingEvent extends ProfileEvent {}

// class ProfileManageMyStores extends ProfileEvent {}
