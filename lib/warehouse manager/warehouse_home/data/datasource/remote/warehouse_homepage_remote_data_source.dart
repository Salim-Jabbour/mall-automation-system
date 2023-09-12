import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../models/product_details_model.dart';
import '../../../models/product_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class WarehouseHomePageRemoteDataSource {
  Future<Either<Failure, ProductModel>> getWareHouseHomePageProductsInfo(
      String token);

  Future<Either<Failure, ProductDetailsModel>>
      getWareHouseHomePageProductDetails({
    required String token,
    required String productID,
  });
}

class WarehouseHomePageRemoteDataSourceImpl
    extends WarehouseHomePageRemoteDataSource {
  final Dio dioClient;

  WarehouseHomePageRemoteDataSourceImpl(this.dioClient);
  @override
  Future<Either<Failure, ProductModel>> getWareHouseHomePageProductsInfo(
      String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get('/warehouseProducts');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
          ProductModel.fromJson(response.data as Map<String, dynamic>),
        );
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
  Future<Either<Failure, ProductDetailsModel>>
      getWareHouseHomePageProductDetails(
          {required String token, required String productID}) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get('/warehouseProducts/$productID');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
          ProductDetailsModel.fromJson(response.data as Map<String, dynamic>),
        );
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
