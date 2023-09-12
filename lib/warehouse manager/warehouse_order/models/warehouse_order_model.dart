import 'package:json_annotation/json_annotation.dart';

part 'warehouse_order_model.g.dart';

@JsonSerializable()
class Investor {
  final int? id;
  final String? name;

  Investor(this.id, this.name);

  factory Investor.fromJson(Map<String, dynamic> json) =>
      _$InvestorFromJson(json);
  Map<String, dynamic> toJson() => _$InvestorToJson(this);
}

@JsonSerializable()
class WarehouseOrdersDataModel {
  final int? id;
  final List<Investor>? investor;
  @JsonKey(name: 'request_date')
  final String? requestDate;
  final String? status;
  final int? received;
  final dynamic quantity;

  WarehouseOrdersDataModel(this.id, this.investor, this.requestDate,
      this.status, this.received, this.quantity);

  factory WarehouseOrdersDataModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseOrdersDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$WarehouseOrdersDataModelToJson(this);
}

@JsonSerializable()
class WarehouseOrdersModel {
  final List<WarehouseOrdersDataModel>? data;
  final String? message;

  WarehouseOrdersModel(this.data, this.message);

  factory WarehouseOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseOrdersModelFromJson(json);
  Map<String, dynamic> toJson() => _$WarehouseOrdersModelToJson(this);
}
