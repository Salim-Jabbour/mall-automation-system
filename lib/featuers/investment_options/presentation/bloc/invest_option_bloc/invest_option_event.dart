part of 'invest_option_bloc.dart';

@immutable
abstract class InvestOptionEvent {}

class GetInvestStoreOption extends InvestOptionEvent {
  final String token;

  GetInvestStoreOption({required this.token});
}

class InvestStoreEvent extends InvestOptionEvent {
  final int storeId;
  final String token;

  InvestStoreEvent({
    required this.storeId,
    required this.token,
  });
}
