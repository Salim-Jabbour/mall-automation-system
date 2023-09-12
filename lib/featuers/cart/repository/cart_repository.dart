import 'package:dartz/dartz.dart';
import 'package:jessy_mall/featuers/cart/models/cart_model.dart';

import '../../../core/errors/base_error.dart';

abstract class CartRepository {
  Future<Either<Failure, CartModel>> getAllCartOrder(String token);
  Future<Either<Failure, String>> removeCartOrderById(String token, int id);
  Future<Either<Failure, String>> postBuyCartOrder(
      String token, String cartOrdersIds, String addressLocation);
}
