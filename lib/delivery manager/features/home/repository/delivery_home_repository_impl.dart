import 'package:dartz/dartz.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/errors/execption.dart';
import '../../../../core/network/network_info.dart';
import '../data/datasource/delivery_home_remote_datasource.dart';
import '../models/delivery_order_model.dart';
import 'delivery_home_repository.dart';

class DeliveryHomeRepositoryImpl extends DeliveryHomeRepository {
  final DeliveryHomeRemoteDataSource _deliveryHomeRemoteDataSource;
  final NetworkInfo _networkInfo;

  DeliveryHomeRepositoryImpl(
      this._deliveryHomeRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, DeliveryOrderModel>> getDeliveryOrders(
      {required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _deliveryHomeRemoteDataSource.getDeliveryOrders(token: token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getDeliveryOrders) {
            return right(getDeliveryOrders);
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
  Future<Either<Failure, DeliveryOrderModel>> getDeliveryPendingOrders(
      {required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _deliveryHomeRemoteDataSource
            .getDeliveryPendingOrders(token: token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getDeliveryPendingOrders) {
            return right(getDeliveryPendingOrders);
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
  Future<Either<Failure, DeliveryOrderModel>> getDeliveryHistoryOrders(
      {required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _deliveryHomeRemoteDataSource
            .getDeliveryHistoryOrders(token: token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getDeliveryHistoryOrders) {
            return right(getDeliveryHistoryOrders);
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
  Future<Either<Failure, String>> postDeliveryOrdersApprovedStatues(
      {required int id, required String token, required String statues}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _deliveryHomeRemoteDataSource
            .postDeliveryOrdersApprovedStatues(
                token: token, statues: statues, id: id);

        return addSuccess.fold((failure) {
          return Left(failure);
        }, (msgResponse) {
          return right(msgResponse);
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, String>> postDeliveryOrdersDeliverdStatues(
      {required int id, required String token, required int statues}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _deliveryHomeRemoteDataSource
            .postDeliveryOrdersDeliverdStatues(
                token: token, statues: statues, id: id);

        return addSuccess.fold((failure) {
          return Left(failure);
        }, (msgResponse) {
          return right(msgResponse);
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
