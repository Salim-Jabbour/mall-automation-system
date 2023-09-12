import 'package:dartz/dartz.dart';
import 'package:jessy_mall/featuers/investment_options/models/investment_store_model.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/bloc/invest_option_bloc/invest_option_bloc.dart';

import '../../../core/errors/base_error.dart';
import '../../manage_store/models/store_model.dart';

abstract class InvestOptionRepository {
  Future<Either<Failure, InvestStoreModel>> getStoreOptionToInvest(
      String token);

  Future<Either<Failure, void>> postInvestStorebyId(int id, String token);
}
