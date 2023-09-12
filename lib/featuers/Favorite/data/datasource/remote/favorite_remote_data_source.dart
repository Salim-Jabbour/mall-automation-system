import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../models/favorite_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class FavoriteRemoteDataSource {
  Future<Either<Failure, FavoriteModel>> getfavoriteProducts(String token);
  Future<Either<Failure, String>> removefavoriteProduct(String token, int id);
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final Dio dioClient;

  FavoriteRemoteDataSourceImpl(this.dioClient);
  @override
  Future<Either<Failure, FavoriteModel>> getfavoriteProducts(
      String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get('/favoriteProducts');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            FavoriteModel.fromJson(response.data as Map<String, dynamic>));
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
  Future<Either<Failure, String>> removefavoriteProduct(
      String token, int id) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.post('/favoriteProducts',
          data: {"store_product_id": id, "_method": "DELETE"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("delete favorite product done");
        return Right("delete favorite product done");
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
