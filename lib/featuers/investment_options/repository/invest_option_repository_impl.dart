import 'package:dartz/dartz.dart';
import 'package:jessy_mall/core/errors/execption.dart';
import 'package:jessy_mall/core/network/network_info.dart';
import 'package:jessy_mall/featuers/investment_options/data/datasource/invest_store_option_remote_datasource.dart';
import 'package:jessy_mall/featuers/investment_options/models/investment_store_model.dart';
import 'package:jessy_mall/featuers/investment_options/repository/invest_option_repository.dart';
import 'package:jessy_mall/featuers/manage_store/models/store_model.dart';

import '../../../core/errors/base_error.dart';

class InvestOptionRepositoryImpl extends InvestOptionRepository {
  final InvestStoreOptionRemoteDatasource _investStoreOptionRemoteDataSource;
  final NetworkInfo _networkInfo;

  InvestOptionRepositoryImpl(
      this._investStoreOptionRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, InvestStoreModel>> getStoreOptionToInvest(
      String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _investStoreOptionRemoteDataSource
            .getStoreOptionToInvest(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getStoreInfo) {
            return right(getStoreInfo);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, void>> postInvestStorebyId(
      int id, String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _investStoreOptionRemoteDataSource
            .postInvestStoreId(storeId: id, token: token);

        return addSuccess.fold((failure) {
          print('xxxxxxxxxxxxxxxxxxxxxxx');
          return Left(failure);
        }, (_)  {
            print('sssssssssssssssssssssssss');
          return right(_);
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
