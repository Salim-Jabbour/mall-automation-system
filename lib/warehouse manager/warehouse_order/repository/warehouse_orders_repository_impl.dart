import 'package:dartz/dartz.dart';
import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_order/models/warehouse_order_details_model.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_order/models/warehouse_order_model.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_order/repository/warehouse_orders_repository.dart';

import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import '../data/datasource/remote/warehouse_orders_remote_datasource.dart';

class WarehouseOrdersRepositoryImpl extends WarehouseOrdersRepository {
  final WarehouseOrdersRemoteDataSource _warehouseOrdersRemoteDataSource;
  final NetworkInfo _networkInfo;

  WarehouseOrdersRepositoryImpl(
      this._warehouseOrdersRemoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, WarehouseOrdersModel>> getApproved(
      String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _warehouseOrdersRemoteDataSource.getApproved(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getApprovedData) {
            return right(getApprovedData);
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
  Future<Either<Failure, WarehouseOrdersModel>> getPending(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _warehouseOrdersRemoteDataSource.getPending(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getPendingData) {
            return right(getPendingData);
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
  Future<Either<Failure, WarehouseOrdersModel>> getRejected(
      String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _warehouseOrdersRemoteDataSource.getRejected(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getRejectedData) {
            return right(getRejectedData);
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
  Future<Either<Failure, WarehouseOrderDetailsModel>> getPendingDetails(
      String token, String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _warehouseOrdersRemoteDataSource.getPendingDetails(token, id);
        return addSuccess.fold(
          (failure) => Left(failure),
          (details) {
            return right(details);
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
  Future<Either<Failure, String>> confirmTheOrder(
      String token, String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _warehouseOrdersRemoteDataSource.confirmTheOrder(token, id);
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
  Future<Either<Failure, String>> rejectTheOrder(
      String token, String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _warehouseOrdersRemoteDataSource.rejectTheOrder(token, id);
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
