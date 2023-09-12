import 'package:dartz/dartz.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_home/models/product_model.dart';

import '../../../core/errors/base_error.dart';
import '../models/product_details_model.dart';

abstract class WarehouseHomePageProductsRepository {
  Future<Either<Failure, ProductModel>> getWareHouseHomePageProductsInfo(
      String token);

  Future<Either<Failure, ProductDetailsModel>>
      getWareHouseHomePageProductDetails({
    required String token,
    required String productID,
  });
}
