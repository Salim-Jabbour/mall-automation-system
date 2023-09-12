import 'package:dartz/dartz.dart';

import '../../../core/errors/base_error.dart';
import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import '../data/datasource/remote/outcome_remote_data_source.dart';
import '../models/outcome_model.dart';
import 'outcome_repository.dart';

class OutcomeRepositoryImpl extends OutcomeRepository {
  final NetworkInfo _networkInfo;
  final OutcomeRemoteDataSource _outcomeRemoteDataSource;

  OutcomeRepositoryImpl(this._networkInfo, this._outcomeRemoteDataSource);
  @override
  Future<Either<Failure, OutcomeModel>> getOutcomeProducts(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _outcomeRemoteDataSource.getOutcomeProducts(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getOutcomeData) {
            return right(getOutcomeData);
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
