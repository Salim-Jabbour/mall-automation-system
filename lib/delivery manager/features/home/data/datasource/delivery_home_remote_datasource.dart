import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../models/delivery_order_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class DeliveryHomeRemoteDataSource {
  Future<Either<Failure, DeliveryOrderModel>> getDeliveryOrders(
      {required String token});

  Future<Either<Failure, DeliveryOrderModel>> getDeliveryPendingOrders(
      {required String token});

  Future<Either<Failure, DeliveryOrderModel>> getDeliveryHistoryOrders(
      {required String token});

  Future<Either<Failure, String>> postDeliveryOrdersApprovedStatues(
      {required String token, required String statues, required id});

  Future<Either<Failure, String>> postDeliveryOrdersDeliverdStatues(
      {required String token, required int statues, required id});
}

class DeliveryHomeRemoteDataSourceImpl extends DeliveryHomeRemoteDataSource {
  final Dio dioClient;
  DeliveryHomeRemoteDataSourceImpl(this.dioClient);

  @override
  Future<Either<Failure, DeliveryOrderModel>> getDeliveryOrders(
      {required String token}) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.get('/orders');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            DeliveryOrderModel.fromJson(response.data as Map<String, dynamic>));
      }
    } on DioError catch (e) {
      if (e.response == null) {
        return left(NoInternetFailure());
      }
      if (e.response!.data['message'] != null) {
        //TODO: response.message
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
  Future<Either<Failure, DeliveryOrderModel>> getDeliveryPendingOrders(
      {required String token}) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.get('/orders/pending');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            DeliveryOrderModel.fromJson(response.data as Map<String, dynamic>));
      }
    } on DioError catch (e) {
      if (e.response == null) {
        return left(NoInternetFailure());
      }
      if (e.response!.data['message'] != null) {
        //TODO: response.message
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
  Future<Either<Failure, DeliveryOrderModel>> getDeliveryHistoryOrders(
      {required String token}) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});

      response = await dioClient.get('/orders/history');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
            DeliveryOrderModel.fromJson(response.data as Map<String, dynamic>));
      }
    } on DioError catch (e) {
      if (e.response == null) {
        return left(NoInternetFailure());
      }
      if (e.response!.data['message'] != null) {
        //TODO: response.message
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
  Future<Either<Failure, String>> postDeliveryOrdersApprovedStatues(
      {required String token, required String statues, required id}) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.put(
        '/orders/$id/changeApprovedStatus',
        data: {
          'status': statues,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("post Delivery Orders Approved Statues is done");
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
  Future<Either<Failure, String>> postDeliveryOrdersDeliverdStatues(
      {required String token, required int statues, required id}) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.put(
        '/orders/$id/changeDeliveredStatus',
        data: {
          'status': statues,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("change Delivered Status is done");
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
