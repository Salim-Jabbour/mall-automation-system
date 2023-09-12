import 'package:json_annotation/json_annotation.dart';

part 'outcome_model.g.dart'; // This is the generated file

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
class OutcomeDataModel {
  final int? id;
  @JsonKey(name: 'warehouse_product')
  final List<WarehouseProduct>? warehouseProduct;
  @JsonKey(name: 'warehouse_store')
  final String? warehouseStore;
  @JsonKey(name: 'quantity_before')
  final int? quantityBefore;
  @JsonKey(name: 'quantity_after')
  final int? quantityAfter;
  @JsonKey(name: 'out_date')
  final String? outDate;

  OutcomeDataModel({
    this.id,
    this.warehouseProduct,
    this.warehouseStore,
    this.quantityBefore,
    this.quantityAfter,
    this.outDate,
  });

  factory OutcomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$OutcomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$OutcomeDataModelToJson(this);
}

@JsonSerializable()
class OutcomeModel {
  final List<OutcomeDataModel>? data;
  final String? message;

  OutcomeModel({this.data, this.message});

  factory OutcomeModel.fromJson(Map<String, dynamic> json) =>
      _$OutcomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$OutcomeModelToJson(this);
}
