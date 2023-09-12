import 'package:dartz/dartz.dart';

import 'package:jessy_mall/core/errors/base_error.dart';

import 'package:jessy_mall/warehouse%20manager/warehouse_income_outcome/models/income_model.dart';

import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import '../data/datasource/remote/income_remote_data_source.dart';
import 'Income_repository.dart';

class IncomeRepositoryImpl extends IncomeRepository {
  final NetworkInfo _networkInfo;
  final IncomeRemoteDataSource _incomeRemoteDataSource;

  IncomeRepositoryImpl(this._networkInfo, this._incomeRemoteDataSource);
  @override
  Future<Either<Failure, IncomeModel>> getIncomeProducts(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _incomeRemoteDataSource.getIncomeProducts(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getIncomeData) {
            return right(getIncomeData);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
