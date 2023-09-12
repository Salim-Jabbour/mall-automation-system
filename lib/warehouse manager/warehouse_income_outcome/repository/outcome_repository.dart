import 'package:dartz/dartz.dart';

import '../../../core/errors/base_error.dart';
import '../models/outcome_model.dart';

abstract class OutcomeRepository {
  Future<Either<Failure, OutcomeModel>> getOutcomeProducts(String token);
}
