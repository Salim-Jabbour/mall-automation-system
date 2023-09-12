import 'package:dartz/dartz.dart';

import '../../../core/errors/base_error.dart';
import '../models/warehouse_extra_space_requests_model.dart';

abstract class WarehouseExtraSpaceRequestsRepository {
  Future<Either<Failure, WarehouseExtraSpaceRequestsModel>>
      getWareHouseSpaceRequests(String token);

  Future<Either<Failure, String>> confirmSpaceRequest(String token, String id);

  Future<Either<Failure, String>> rejectSpaceRequest(String token, String id);
}
