import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/featuers/Auth/models/user_model.dart';
import 'package:jessy_mall/featuers/Auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepostitory;
  AuthBloc(this._authRepostitory) : super(AuthInitial()) {
    on<AuthRegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final successOrFailuer = await _authRepostitory.postRegistration(
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            number: event.number,
            password: event.password,
            investmentOption: event.investmentOption);
        successOrFailuer.fold((error) {
          emit(AuthSignUpFailed(faliuer: error));
        }, (registerModel) async {

          emit(AuthSignUpSuccess(user: registerModel));
                    token = await _authRepostitory.getToken();
          role = await _authRepostitory.getUserRole();
          userName = await _authRepostitory.getUserName();
          investmentOption = _authRepostitory.getInvestmentOption();
        });
      } catch (e) {
        rethrow;
      }
    });

    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());

      final successOrFailuer = await _authRepostitory.postLogin(
        email: event.email,
        password: event.password,
      );

      successOrFailuer.fold((error) {
        emit(AuthLoginFailed(faliuer: error));
      }, (loginModel) async {
        emit(AuthLoginSuccess(user: loginModel));
        token = await _authRepostitory.getToken();
        role = await _authRepostitory.getUserRole();
        userName = await _authRepostitory.getUserName();
        investmentOption = _authRepostitory.getInvestmentOption();
      });
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());

      final successOrFailuer = await _authRepostitory.logout();
      successOrFailuer.fold((error) {
        emit(AuthLogoutFailed(faliuer: error));
      }, (isLoggedOut) {
        emit(AuthLogoutSuccess());
      });
    });

    on<AuthGetUserLocalInfo>((event, emit) async {
      token = await _authRepostitory.getToken();
      role = await _authRepostitory.getUserRole();
      userName = await _authRepostitory.getUserName();
      investmentOption = _authRepostitory.getInvestmentOption();
    });
    on<AuthChangeInvestmentOption>((event, emit) async {
      _authRepostitory.setInvestmentOptine(event.investmentOption);
      investmentOption = event.investmentOption;
    });
  }
  String? token;
  String? role;
  String? userName;
  int? investmentOption = 0;
}
