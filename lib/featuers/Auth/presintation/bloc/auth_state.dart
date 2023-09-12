part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSignUpSuccess extends AuthState {
  AuthSignUpSuccess({required this.user});
  final UserModel user;
}

class AuthLoginSuccess extends AuthState {
  AuthLoginSuccess({required this.user});
  final UserModel user;
}

class AuthLogoutSuccess extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginFailed extends AuthState {
  AuthLoginFailed({required this.faliuer});
  final Failure faliuer;
}
class AuthSignUpFailed extends AuthState {
  AuthSignUpFailed({required this.faliuer});
  final Failure faliuer;
}
class AuthLogoutFailed extends AuthState {
  AuthLogoutFailed({required this.faliuer});
  final Failure faliuer;
}
