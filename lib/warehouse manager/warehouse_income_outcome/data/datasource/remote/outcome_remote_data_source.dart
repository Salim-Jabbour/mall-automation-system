import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../models/outcome_model.dart';

abstract class OutcomeRemoteDataSource {
  Future<Either<Failure, OutcomeModel>> getOutcomeProducts(String token);
}

class OutcomeRemoteDataSourceImpl extends OutcomeRemoteDataSource {
  final Dio dioClient;

  OutcomeRemoteDataSourceImpl(this.dioClient);
  @override
  Future<Either<Failure, OutcomeModel>> getOutcomeProducts(String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get("/outs");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            OutcomeModel.fromJson(response.data as Map<String, dynamic>));
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
