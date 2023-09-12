import 'package:dartz/dartz.dart';

import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/featuers/home/data/datasource/remote/home_remote_data_source.dart';

import 'package:jessy_mall/featuers/home/models/home_model.dart';

import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import '../../profile/data/datasource/remote/profile_remote_data_source.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this._homeRemoteDataSource, this._networkInfo);
  final HomeRemoteDataSource _homeRemoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, StoreModel>> getStoresInType(
      {required String token, required String type, String? search}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _homeRemoteDataSource.getStoresInType(
            token: token, type: type, search: search);

        return addSuccess.fold(
          (failure) => Left(failure),
          (storeModel) {
            return right(storeModel);
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
  Future<Either<Failure, CategoryModel>> getStoresCategory(
      {required String token, required int storeId}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _homeRemoteDataSource.getStoresCategory(
            token: token, storeId: storeId);

        return addSuccess.fold(
          (failure) => Left(failure),
          (categoryModel) {
            return right(categoryModel);
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
  Future<Either<Failure, ProductModel>> getProductInCategory(
      {required String token,
      required int storeId,
      String? search,
      required String categoryName}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _homeRemoteDataSource.getProductInCategory(
            token: token,
            storeId: storeId,
            categoryName: categoryName,
            search: search);

        return addSuccess.fold(
          (failure) => Left(failure),
          (prodcutModel) {
            return right(prodcutModel);
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
  Future<Either<Failure, bool>> addProductToCart(
      {required String token,
      required int productId,
      required int quantity,
      bool? isMarket}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _homeRemoteDataSource.addProductToCart(
            token: token,
            quantity: quantity,
            productId: productId,
            isMarket: isMarket);

        return addSuccess.fold(
          (failure) => Left(failure),
          (t) {
            return right(t);
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
  Future<Either<Failure, bool>> addProductToFavorite(
      {required String token, required int productId}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _homeRemoteDataSource.addProductToFavorite(
          token: token,
          productId: productId,
        );

        return addSuccess.fold(
          (failure) => Left(failure),
          (t) {
            return right(t);
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
