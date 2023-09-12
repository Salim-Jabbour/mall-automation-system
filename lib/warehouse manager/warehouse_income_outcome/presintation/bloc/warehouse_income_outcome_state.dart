part of 'warehouse_income_outcome_bloc.dart';

@immutable
abstract class WarehouseIncomeOutcomeState {}

class WarehouseInitial extends WarehouseIncomeOutcomeState {}
//income states

class WarehouseIncomeLoading extends WarehouseIncomeOutcomeState {}

class WarehouseIncomeGetDataFailed extends WarehouseIncomeOutcomeState {
  final Failure faliuer;

  WarehouseIncomeGetDataFailed({required this.faliuer});
}

class WarehouseIncomeGetDataSuccess extends WarehouseIncomeOutcomeState {
  final IncomeModel incomeModel;

  WarehouseIncomeGetDataSuccess({required this.incomeModel});
}

//outcome states

class WarehouseOutcomeLoading extends WarehouseIncomeOutcomeState {}

class WarehouseOutcomeGetDataFailed extends WarehouseIncomeOutcomeState {
  final Failure faliuer;

  WarehouseOutcomeGetDataFailed({required this.faliuer});
}

class WarehouseOutcomeGetDataSuccess extends WarehouseIncomeOutcomeState {
  final OutcomeModel outcomeModel;

  WarehouseOutcomeGetDataSuccess({required this.outcomeModel});
}
