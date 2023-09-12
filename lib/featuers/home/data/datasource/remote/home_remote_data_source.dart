import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../models/home_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, StoreModel>> getStoresInType(
      {required String token, required String type, String? search});

  Future<Either<Failure, CategoryModel>> getStoresCategory(
      {required String token, required int storeId});

  Future<Either<Failure, ProductModel>> getProductInCategory(
      {required String token,
      required int storeId,
      String? search,
      required String categoryName});
  Future<Either<Failure, bool>> addProductToCart(
      {required String token,
      required int productId,
      required int quantity,
      bool? isMarket});
      Future<Either<Failure, bool>> addProductToFavorite(
      {required String token,
      required int productId,});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.dioClient);
  final Dio dioClient;

  @override
  Future<Either<Failure, StoreModel>> getStoresInType(
      {required String token, required String type, String? search}) async {
    Map data;
    if (search != '') {
      data = {"name": search, "type": type};
    } else {
      data = {"type": type};
    }
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.post('/searchStoreInType', data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            StoreModel.fromJson(response.data as Map<String, dynamic>));
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
  Future<Either<Failure, CategoryModel>> getStoresCategory(
      {required String token, required int storeId}) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.get(
        '/storeProductCategory/$storeId',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            CategoryModel.fromJson(response.data as Map<String, dynamic>));
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
  Future<Either<Failure, ProductModel>> getProductInCategory(
      {required String token,
      required int storeId,
      String? search,
      required String categoryName}) async {
    final Response response;
    Map data;
    if (search != '') {
      data = {"category": categoryName, "store_id": storeId, "name": search};
    } else {
      data = {"category": categoryName, "store_id": storeId};
    }
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response =
          await dioClient.post('/searchStoreProductInCategory', data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            ProductModel.fromJson(response.data as Map<String, dynamic>));
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
  Future<Either<Failure, bool>> addProductToCart(
      {required String token,
      required int productId,
      required int quantity,
      bool? isMarket}) async {
    print(isMarket);
    Map data;
    if (isMarket == false) {
      data = {
        'stand_product_id': productId,
        "quantity": quantity,
      };
    } else {
         data = {
        'store_product_id': productId,
        "quantity": quantity,
      };
   
    }

    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.post('/cartOrders', data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(true);
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
  Future<Either<Failure, bool>> addProductToFavorite({required String token, required int productId}) async {

 

    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.post('/favoriteProducts', data: {
        "store_product_id":productId,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(true);
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
