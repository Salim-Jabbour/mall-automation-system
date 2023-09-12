import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../models/warehouse_extra_space_requests_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class WarehouseExtraSpaceRequestsRemotedataSource {
  Future<Either<Failure, WarehouseExtraSpaceRequestsModel>>
      getWareHouseSpaceRequests(String token);

  Future<Either<Failure, String>> confirmSpaceRequest(String token, String id);

  Future<Either<Failure, String>> rejectSpaceRequest(String token, String id);
}

class WarehouseExtraSpaceRequestsRemotedataSourceImpl
    extends WarehouseExtraSpaceRequestsRemotedataSource {
  final Dio dioClient;

  WarehouseExtraSpaceRequestsRemotedataSourceImpl(this.dioClient);
  @override
  Future<Either<Failure, WarehouseExtraSpaceRequestsModel>>
      getWareHouseSpaceRequests(String token) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.get('/increaseWarehouseSpaceRequests');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(WarehouseExtraSpaceRequestsModel.fromJson(
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
  Future<Either<Failure, String>> confirmSpaceRequest(
      String token, String id) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.put(
          '/increaseWarehouseSpaceRequests/$id/warehouseManagerApproval',
          data: {
            "warehouse_manager_approval": "approved",
          });
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
  Future<Either<Failure, String>> rejectSpaceRequest(
      String token, String id) async {
    final Response response;
    try {
      dioClient.options.headers.addAll({'authorization': 'Bearer $token'});
      response = await dioClient.put(
          '/increaseWarehouseSpaceRequests/$id/warehouseManagerApproval',
          data: {
            "warehouse_manager_approval": "rejected",
          });
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
