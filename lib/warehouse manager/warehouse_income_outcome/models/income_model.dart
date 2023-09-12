import 'package:json_annotation/json_annotation.dart';

part 'income_model.g.dart'; // This is the generated file

@JsonSerializable()
class WarehouseProduct {
  final int? id;
  final String? name;

  WarehouseProduct({this.id, this.name});

  factory WarehouseProduct.fromJson(Map<String, dynamic> json) =>
      _$WarehouseProductFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseProductToJson(this);
}

@JsonSerializable()
class IncomeDataModel {
  final int? id;
  @JsonKey(name: 'warehouse_product')
  final List<WarehouseProduct>? warehouseProduct;
  @JsonKey(name: 'warehouse_store')
  final String? warehouseStore;
  @JsonKey(name: 'quantity_before')
  final int? quantityBefore;
  @JsonKey(name: 'quantity_after')
  final int? quantityAfter;
  @JsonKey(name: 'in_date')
  final String? inDate;

  IncomeDataModel({
    this.id,
    this.warehouseProduct,
    this.warehouseStore,
    this.quantityBefore,
    this.quantityAfter,
    this.inDate,
  });

  factory IncomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$IncomeDataModelToJson(this);
}

@JsonSerializable()
class IncomeModel {
  final List<IncomeDataModel>? data;
  final String? message;

  IncomeModel({this.data, this.message});

  factory IncomeModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$IncomeModelToJson(this);
}
