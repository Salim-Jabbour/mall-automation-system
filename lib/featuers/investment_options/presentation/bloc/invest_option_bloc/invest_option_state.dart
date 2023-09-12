part of 'invest_option_bloc.dart';

@immutable
abstract class InvestOptionState {}

class InvestOptionInitial extends InvestOptionState {}

class InvestOptionLoading extends InvestOptionState {}

class InvestStoreOptionSuccessd extends InvestOptionState {
  //Todo add model
  final InvestStoreModel investStoreModel;

  InvestStoreOptionSuccessd({required this.investStoreModel});
}

class InvestStoreOptionFailed extends InvestOptionState {
  final Failure failure;

  InvestStoreOptionFailed({required this.failure});
}

class InvestStoreByIdSuccess extends InvestOptionState {}
class InvestStoreByIdFailed extends InvestOptionState {
  final Failure failure;

  InvestStoreByIdFailed({required this.failure});
}

class InvestStoreByIdLoading extends InvestOptionState {}
