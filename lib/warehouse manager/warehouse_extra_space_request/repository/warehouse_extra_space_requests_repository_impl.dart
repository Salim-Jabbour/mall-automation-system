import 'package:dartz/dartz.dart';
import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_extra_space_request/models/warehouse_extra_space_requests_model.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_extra_space_request/repository/warehouse_extra_space_requests_repository.dart';

import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import '../data/datasource/remote/warehouse_extra_space_requests_remote_datasource.dart';

class WarehouseExtraSpaceRequestsRepositoryImpl
    extends WarehouseExtraSpaceRequestsRepository {
  final WarehouseExtraSpaceRequestsRemotedataSource
      _warehouseExtraSpaceRequestsRemotedataSource;
  final NetworkInfo _networkInfo;

  WarehouseExtraSpaceRequestsRepositoryImpl(
      this._warehouseExtraSpaceRequestsRemotedataSource, this._networkInfo);
  @override
  Future<Either<Failure, WarehouseExtraSpaceRequestsModel>>
      getWareHouseSpaceRequests(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _warehouseExtraSpaceRequestsRemotedataSource
            .getWareHouseSpaceRequests(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getSpaceRequestsInfo) {
            return right(getSpaceRequestsInfo);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, String>> confirmSpaceRequest(
      String token, String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _warehouseExtraSpaceRequestsRemotedataSource
            .confirmSpaceRequest(token, id);
        return addSuccess.fold(
          (failure) => Left(failure),
          (confirmMessage) {
            return right(confirmMessage);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, String>> rejectSpaceRequest(
      String token, String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _warehouseExtraSpaceRequestsRemotedataSource
            .rejectSpaceRequest(token, id);
        return addSuccess.fold(
          (failure) => Left(failure),
          (rejectMessage) {
            return right(rejectMessage);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
