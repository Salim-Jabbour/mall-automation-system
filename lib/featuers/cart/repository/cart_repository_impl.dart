import 'package:dartz/dartz.dart';

import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/featuers/cart/data/datasource/cart_remote_datasource.dart';
import 'package:jessy_mall/featuers/cart/models/cart_model.dart';

import 'package:jessy_mall/featuers/profile/models/profile_model.dart';

import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import 'cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;
  final NetworkInfo _networkInfo;

  CartRepositoryImpl(this._cartRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, CartModel>> getAllCartOrder(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _cartRemoteDataSource.getAllCartOrder(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getCartModel) {
            return right(getCartModel);
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
  Future<Either<Failure, String>> postBuyCartOrder(
      String token, String cartOrdersIds, String addressLocation) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _cartRemoteDataSource.postBuyCartOrder(
            token, cartOrdersIds, addressLocation);
        return addSuccess.fold(
          (failure) => Left(failure),
          (string) {
            return right(string);
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
  Future<Either<Failure, String>> removeCartOrderById(
      String token, int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _cartRemoteDataSource.removeCartOrderById(token, id);
        return addSuccess.fold(
          (failure) => Left(failure),
          (string) {
            return right(string);
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
