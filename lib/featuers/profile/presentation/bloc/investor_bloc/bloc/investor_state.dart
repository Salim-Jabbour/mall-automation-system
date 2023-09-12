part of 'investor_bloc.dart';

@immutable
 class InvestorState {}

final class InvestorInitial extends InvestorState {}

final class InvestorGetProductLoading extends InvestorState {}

final class InvestorGetProductSuccess extends InvestorState {
  final InvestorProductModel investorProductModel;
  InvestorGetProductSuccess({required this.investorProductModel});
}

final class InvestorGetProductFailuer extends InvestorState {
  final Failure failure;
  InvestorGetProductFailuer({required this.failure});
}
final class InvestorDeleteProductFromStoreLoading
    extends InvestorState {}

final class InvestorDeleteProductFromStoreSuccess
    extends InvestorState {}

final class InvestorDeleteProductFromStoreFailure
    extends InvestorState {
  final Failure failure;
  InvestorDeleteProductFromStoreFailure({required this.failure});
}

final class InvestorGetBillsLoading extends InvestorState {}

final class InvestorGetBillsSuccess extends InvestorState {
  final investorBillsModel investorBilssModel;
  InvestorGetBillsSuccess({required this.investorBilssModel});
}

final class InvestorGetBillsFailure extends InvestorState {
  final Failure failure;
  InvestorGetBillsFailure({required this.failure});
}