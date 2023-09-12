import 'package:dartz/dartz.dart';

import '../../../core/errors/base_error.dart';
import '../models/favorite_model.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, FavoriteModel>> getfavoriteProducts(String token);
  Future<Either<Failure, String>> removefavoriteProduct(String token, int id);
}
