import 'package:dartz/dartz.dart';

import '../../../core/errors/base_error.dart';
import '../models/warehouse_order_details_model.dart';
import '../models/warehouse_order_model.dart';

abstract class WarehouseOrdersRepository {
  Future<Either<Failure, WarehouseOrdersModel>> getPending(String token);
  Future<Either<Failure, WarehouseOrdersModel>> getApproved(String token);
  Future<Either<Failure, WarehouseOrdersModel>> getRejected(String token);
  Future<Either<Failure, WarehouseOrderDetailsModel>> getPendingDetails(
      String token, String id);

  Future<Either<Failure, String>> confirmTheOrder(String token, String id);
  Future<Either<Failure, String>> rejectTheOrder(String token, String id);
}
