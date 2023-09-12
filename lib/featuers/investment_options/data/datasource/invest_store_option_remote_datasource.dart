import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jessy_mall/featuers/investment_options/models/investment_store_model.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/resource/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class InvestStoreOptionRemoteDatasource {
  Future<Either<Failure, InvestStoreModel>> getStoreOptionToInvest(
      String token);

  Future<Either<Failure, void>> postInvestStoreId({
    required int storeId,
    required String token,
  });
}

class InvestStoreOptionRemoteDatasourceImpl
    extends InvestStoreOptionRemoteDatasource {
  final Dio dioClient;

  InvestStoreOptionRemoteDatasourceImpl(this.dioClient);

  @override
  Future<Either<Failure, InvestStoreModel>> getStoreOptionToInvest(
      String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.post('/allUninventedStores');
      if (response.statusCode == 200 || response.statusCode == 201) {
        //TODO: note: as Map<String, dynamic>
        return Right(
            InvestStoreModel.fromJson(response.data as Map<String, dynamic>));
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
  Future<Either<Failure, void>> postInvestStoreId(
      {required int storeId, required String token}) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.post(
        '/storeInvestment',
        data: {
          'store_id': storeId,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("InvestStoreDone");
        return right(Void);
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
