import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/resource/string_manager.dart';
import '../../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, CartModel>> getAllCartOrder(String token);
  Future<Either<Failure, String>> removeCartOrderById(String token, int id);
  Future<Either<Failure, String>> postBuyCartOrder(
      String token, String cartOrdersIds, String addressLocation);
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final Dio dioClient;

  CartRemoteDataSourceImpl(this.dioClient);

  @override
  Future<Either<Failure, CartModel>> getAllCartOrder(String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.get('/cartOrders');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(CartModel.fromJson(response.data as Map<String, dynamic>));
      }
    } on DioError catch (e) {
      if (e.response == null) {
        return left(NoInternetFailure());
      }
      if (e.response!.data['message'] != null) {
        return left(Failure(message: e.response!.data['message'].toString()));
      } else {
        return Left(
          Failure(message: StringManager.sthWrong.tr()),
        );
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, String>> removeCartOrderById(
      String token, int id) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.delete('/cartOrders/$id');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right("removed order from cart is done");
      }
    } on DioError catch (e) {
      if (e.response == null) {
        return left(NoInternetFailure());
      }
      if (e.response!.data['message'] != null) {
        return left(Failure(message: e.response!.data['message'].toString()));
      } else {
        return Left(
          Failure(message: StringManager.sthWrong.tr()),
        );
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, String>> postBuyCartOrder(
      String token, String cartOrdersIds, String addressLocation) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.post(
        '/orders',
        data: {
          'cart_order_ids': cartOrdersIds,
          'location': addressLocation,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("buy order from cart is done");

        return Right("removed order from cart is done");
      }
    } on DioError catch (e) {
      if (e.response == null) {
        return left(NoInternetFailure());
      }
      if (e.response!.data['message'] != null) {
        return left(Failure(message: e.response!.data['message'].toString()));
      } else {
        return Left(
          Failure(message: StringManager.sthWrong.tr()),
        );
      }
    }
    return Left(ServerFailure());
  }
}
