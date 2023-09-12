part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthRegisterRequested extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String number;
  final String password;
  final int investmentOption;

  AuthRegisterRequested(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.number,
      required this.password,
      required this.investmentOption});
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({
    required this.email,
    required this.password,
  });
}

class AuthLogoutRequested extends AuthEvent {}

class AuthGetUserLocalInfo extends AuthEvent {}

class AuthChangeInvestmentOption extends AuthEvent {
  int investmentOption;
  AuthChangeInvestmentOption({required this.investmentOption});
}
