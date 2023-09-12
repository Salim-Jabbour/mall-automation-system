import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../models/warehouse_order_details_model.dart';
import '../../../models/warehouse_order_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class WarehouseOrdersRemoteDataSource {
  Future<Either<Failure, WarehouseOrdersModel>> getPending(String token);
  Future<Either<Failure, WarehouseOrdersModel>> getApproved(String token);
  Future<Either<Failure, WarehouseOrdersModel>> getRejected(String token);
  Future<Either<Failure, WarehouseOrderDetailsModel>> getPendingDetails(
      String token, String id);
  Future<Either<Failure, String>> confirmTheOrder(String token, String id);
  Future<Either<Failure, String>> rejectTheOrder(String token, String id);
}

class WarehouseOrdersRemoteDataSourceImpl
    extends WarehouseOrdersRemoteDataSource {
  final Dio dioClient;

  WarehouseOrdersRemoteDataSourceImpl(this.dioClient);

  @override
  Future<Either<Failure, WarehouseOrdersModel>> getApproved(
      String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get("/warehouseEntryRequests/approved");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(WarehouseOrdersModel.fromJson(
            response.data as Map<String, dynamic>));
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
  Future<Either<Failure, WarehouseOrdersModel>> getPending(String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get("/warehouseEntryRequests/pending");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(WarehouseOrdersModel.fromJson(
            response.data as Map<String, dynamic>));
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
  Future<Either<Failure, WarehouseOrdersModel>> getRejected(
      String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get("/warehouseEntryRequests/rejected");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(WarehouseOrdersModel.fromJson(
            response.data as Map<String, dynamic>));
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
  Future<Either<Failure, WarehouseOrderDetailsModel>> getPendingDetails(
      String token, String id) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get("/warehouseEntryRequest/$id");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(WarehouseOrderDetailsModel.fromJson(
            response.data as Map<String, dynamic>));
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
  Future<Either<Failure, String>> confirmTheOrder(
      String token, String id) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.post("/warehouseEntryRequest/$id/changeStatus",
          data: {"status": "approved"});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right("Confirmed Successfully");
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
  Future<Either<Failure, String>> rejectTheOrder(
      String token, String id) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.post("/warehouseEntryRequest/$id/changeStatus",
          data: {"status": "rejected"});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right("Rejected Successfully");
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
