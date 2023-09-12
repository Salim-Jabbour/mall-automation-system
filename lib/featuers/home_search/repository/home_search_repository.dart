import 'package:dartz/dartz.dart';

import '../../../core/errors/base_error.dart';
import '../models/home_search_model.dart';

abstract class HomeSearchRepository {
  Future<Either<Failure, HomeSearchModel>> searchProducts(
      String token, String searchInput);
}
