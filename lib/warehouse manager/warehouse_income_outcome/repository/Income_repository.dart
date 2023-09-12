import 'package:dartz/dartz.dart';

import '../../../core/errors/base_error.dart';
import '../models/income_model.dart';

abstract class IncomeRepository {
  Future<Either<Failure, IncomeModel>> getIncomeProducts(String token);
}
