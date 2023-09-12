import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../models/store_model.dart';

abstract class EditStoreInfoRemoteDatasource {
  Future<Either<Failure, StoreModel>> getStoreInfo(String token);
  Future<Either<Failure, StoreModel>> updateStoreInfo(int id, String token,
      String name_ar, String name_en, String openTime, String closeTime);
}

class EditStoreInfoRemoteDatasourceImpl extends EditStoreInfoRemoteDatasource {
  final Dio dioClient;

  EditStoreInfoRemoteDatasourceImpl(this.dioClient);

  @override
  Future<Either<Failure, StoreModel>> getStoreInfo(String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.get('/store');
      if (response.statusCode == 200 || response.statusCode == 201) {
        //TODO: note: as Map<String, dynamic>
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
  Future<Either<Failure, StoreModel>> updateStoreInfo(int id, String token,
      String name_ar, String name_en, String openTime, String closeTime) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.post(
        '/store/$id',
        data: {
          '_method': "PUT",
          'name_ar': name_ar,
          'name_en': name_en,
          'openTime': openTime,
          'closeTime': closeTime,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Update store is done");
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
