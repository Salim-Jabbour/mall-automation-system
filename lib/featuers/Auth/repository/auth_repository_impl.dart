import 'package:dartz/dartz.dart';
import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/core/errors/execption.dart';
import 'package:jessy_mall/core/network/network_info.dart';
import 'package:jessy_mall/featuers/Auth/data/datasource/local/auth_local_data_source.dart';
import 'package:jessy_mall/featuers/Auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:jessy_mall/featuers/Auth/models/user_model.dart';
import 'package:jessy_mall/featuers/Auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(
    this._authRemoteDataSource,
    this._authLocalDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, UserModel>> postRegistration({
    required String firstName,
    required String lastName,
    required String email,
    required String number,
    required String password,
    required int investmentOption,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _authRemoteDataSource.register(
            firstName: firstName,
            lastName: lastName,
            number: number,
            email: email,
            password: password,
            investmentOption: investmentOption);

        return addSuccess.fold((failure) {
          return Left(failure);
        }, (registerResponse) async {
          await _authLocalDataSource.setUserToken(registerResponse.data.token);
          await _authLocalDataSource
              .setUserName(registerResponse.data.user.name);

          await _authLocalDataSource
              .setUserRole(registerResponse.data.user.roles.first);
          _authLocalDataSource.setInvestmentOptine(
              registerResponse.data.user.investment_option ?? 0);
          return right(registerResponse);
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> postLogin(
      {required String email, required String password}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _authRemoteDataSource.login(
          email: email,
          password: password,
        );

        return addSuccess.fold((failure) {
          return Left(failure);
        }, (loginResponse) async {
          await _authLocalDataSource.setUserToken(loginResponse.data.token);
         
          await _authLocalDataSource.setUserName(loginResponse.data.user.name);
          await _authLocalDataSource
              .setUserRole(loginResponse.data.user.roles.first);
          _authLocalDataSource.setInvestmentOptine(
              loginResponse.data.user.investment_option ?? 0);

          return right(loginResponse);
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<String?> getToken() {
    return _authLocalDataSource.getUserToken();
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    final token = await _authLocalDataSource.getUserToken();

    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _authRemoteDataSource.logout(token: token ?? '');
        return addSuccess.fold((failure) {
          return Left(failure);
        }, (islogoutSuccess) {
          _authLocalDataSource.clearAllUserData();
          return right(islogoutSuccess);
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<String?> getUserRole() {
    return _authLocalDataSource.getUserRole();
  }

  @override
  int? getInvestmentOption() {
    return _authLocalDataSource.getInvestmentOptine();
  }

  @override
  Future<void> setInvestmentOptine(int investmentOption) async {
    _authLocalDataSource.setInvestmentOptine(investmentOption);
  }

  @override
  Future<String?> getUserName() {
     print(' dasdasdsa ${_authLocalDataSource.getUserName()}');
    return _authLocalDataSource.getUserName();
  }
}
