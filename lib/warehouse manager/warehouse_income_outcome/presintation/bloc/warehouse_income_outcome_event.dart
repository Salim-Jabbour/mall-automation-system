part of 'warehouse_income_outcome_bloc.dart';

@immutable
abstract class WarehouseIncomeOutcomeEvent {}

//income event
class IncomeGetIncomeDataEvent extends WarehouseIncomeOutcomeEvent {
  final String token;

  IncomeGetIncomeDataEvent({required this.token});
}

//outcome event
class OutcomeGetOutcomeDataEvent extends WarehouseIncomeOutcomeEvent {
  final String token;

  OutcomeGetOutcomeDataEvent({required this.token});
}
