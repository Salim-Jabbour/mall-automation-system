part of 'wearhouse_investor_bloc.dart';

@immutable
class WearhouseInvestorEvent {}

class WearhouseInvestorRequestData extends WearhouseInvestorEvent {
  final String token;
  WearhouseInvestorRequestData({required this.token});
}

class WearhouseInvestorDeleteProduct extends WearhouseInvestorEvent {
  final String token;
  final String productId;
  WearhouseInvestorDeleteProduct(
      {required this.token, required this.productId});
}

class WearhouseInvestorRequestExtraSpace extends WearhouseInvestorEvent {
  final String token;
  final int space;
  WearhouseInvestorRequestExtraSpace(
      {required this.token, required this.space});
}

class WearhouseInvestorRequestIncoms extends WearhouseInvestorEvent {
  final String token;
  String ?toDate;
  String ?fromDate;
  WearhouseInvestorRequestIncoms(
      {required this.token, this.fromDate, this.toDate});
}


class WearhouseInvestorRequestOutcoms extends WearhouseInvestorEvent {
  final String token;
  String ?toDate;
  String ?fromDate;
  WearhouseInvestorRequestOutcoms(
      {required this.token, this.fromDate, this.toDate});
}
