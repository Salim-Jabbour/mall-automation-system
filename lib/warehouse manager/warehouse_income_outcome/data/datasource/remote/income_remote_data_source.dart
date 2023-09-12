import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../models/income_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class IncomeRemoteDataSource {
  Future<Either<Failure, IncomeModel>> getIncomeProducts(String token);
}

class IncomeRemoteDataSourceImpl extends IncomeRemoteDataSource {
  final Dio dioClient;

  IncomeRemoteDataSourceImpl(this.dioClient);
  @override
  Future<Either<Failure, IncomeModel>> getIncomeProducts(String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get("/ins");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            IncomeModel.fromJson(response.data as Map<String, dynamic>));
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
