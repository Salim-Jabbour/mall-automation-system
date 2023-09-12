import 'package:dartz/dartz.dart';

import 'package:jessy_mall/core/errors/base_error.dart';

import 'package:jessy_mall/featuers/home_search/models/home_search_model.dart';

import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import '../data/datasource/remote/home_search_remote_data_source.dart';
import 'home_search_repository.dart';

class HomeSearchRepositoryImpl extends HomeSearchRepository {
  final HomeSearchRemoteDataSource _homeSearchRemoteDataSource;
  final NetworkInfo _networkInfo;

  HomeSearchRepositoryImpl(this._homeSearchRemoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, HomeSearchModel>> searchProducts(
      String token, String searchInput) async {
    if (await _networkInfo.isConnected) {
      try {
        final addsuccess = await _homeSearchRemoteDataSource.searchProducts(
            token, searchInput);

        return addsuccess.fold(
          (failure) => Left(failure),
          (searchedProducts) {
            return right(searchedProducts);
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
