import 'package:dartz/dartz.dart';

import '../../../core/errors/base_error.dart';
import '../models/home_model.dart';

abstract class HomeRepository {
   Future<Either<Failure, StoreModel>> getStoresInType(
   {required   String token,required String type, String? search});

  Future<Either<Failure, CategoryModel>> getStoresCategory(
      {required String token, required int storeId});
      
        Future<Either<Failure, ProductModel>> getProductInCategory(
      {required String token,
      required int storeId,
      String? search,
      required String categoryName});
        Future<Either<Failure, bool>> addProductToCart(
      {required String token,
      required int productId,
      required int quantity,
      bool? isMarket });
          Future<Either<Failure, bool>> addProductToFavorite(
      {required String token,
      required int productId,});

}
