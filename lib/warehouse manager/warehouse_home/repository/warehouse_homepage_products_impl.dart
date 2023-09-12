import 'package:dartz/dartz.dart';

import 'package:jessy_mall/core/errors/base_error.dart';

import 'package:jessy_mall/warehouse%20manager/warehouse_home/models/product_details_model.dart';

import 'package:jessy_mall/warehouse%20manager/warehouse_home/models/product_model.dart';

import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import '../data/datasource/remote/warehouse_homepage_remote_data_source.dart';
import 'warehouse_homepage_products.dart';

class WarehouseHomePageProductsRepositoryImpl
    extends WarehouseHomePageProductsRepository {
  final WarehouseHomePageRemoteDataSource _warehouseHomePageRemoteDataSource;
  final NetworkInfo _networkInfo;

  WarehouseHomePageProductsRepositoryImpl(
      this._warehouseHomePageRemoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, ProductModel>> getWareHouseHomePageProductsInfo(
      String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _warehouseHomePageRemoteDataSource
            .getWareHouseHomePageProductsInfo(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (warehouseHomepageProducts) {
            return right(warehouseHomepageProducts);
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
  Future<Either<Failure, ProductDetailsModel>>
      getWareHouseHomePageProductDetails(
          {required String token, required String productID}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _warehouseHomePageRemoteDataSource
            .getWareHouseHomePageProductDetails(
                token: token, productID: productID);
        return addSuccess.fold(
          (failure) => Left(failure),
          (warehouseHomepageProducts) {
            return right(warehouseHomepageProducts);
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
