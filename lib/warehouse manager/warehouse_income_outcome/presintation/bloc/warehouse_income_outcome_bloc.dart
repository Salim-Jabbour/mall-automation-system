import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/base_error.dart';
import '../../models/income_model.dart';
import '../../models/outcome_model.dart';
import '../../repository/Income_repository.dart';
import '../../repository/outcome_repository.dart';
part 'warehouse_income_outcome_event.dart';
part 'warehouse_income_outcome_state.dart';

class WarehouseIncomeOutcomeBloc
    extends Bloc<WarehouseIncomeOutcomeEvent, WarehouseIncomeOutcomeState> {
  final IncomeRepository _incomeRepository;
  final OutcomeRepository _outcomeRepository;

  WarehouseIncomeOutcomeBloc(this._incomeRepository, this._outcomeRepository)
      : super(WarehouseInitial()) {
    on<IncomeGetIncomeDataEvent>((event, emit) async {
      emit(WarehouseIncomeLoading());
      final successOrFailuer =
          await _incomeRepository.getIncomeProducts(event.token);
      successOrFailuer.fold(
        (error) {
          emit(WarehouseIncomeGetDataFailed(faliuer: error));
        },
        (incomeModel) {
          emit(WarehouseIncomeGetDataSuccess(incomeModel: incomeModel));
        },
      );
    });

    on<OutcomeGetOutcomeDataEvent>((event, emit) async {
      emit(WarehouseOutcomeLoading());
      final successOrFailuer =
          await _outcomeRepository.getOutcomeProducts(event.token);
      successOrFailuer.fold(
        (error) {
          emit(WarehouseOutcomeGetDataFailed(faliuer: error));
        },
        (outcomeModel) {
          emit(WarehouseOutcomeGetDataSuccess(outcomeModel: outcomeModel));
        },
      );
    });
  }
}
