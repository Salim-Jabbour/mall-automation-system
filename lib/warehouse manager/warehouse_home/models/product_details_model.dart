import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart'; // This is the generated file

@JsonSerializable()
class ProductDetailsModel {
  final WarehouseData? data;
  final String? message;

  ProductDetailsModel({
    this.data,
    this.message,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}

@JsonSerializable()
class WarehouseData {
  final String? name;
  final List<WarehouseIn>? ins;
  final List<WarehouseOut>? outs;

  WarehouseData({
    this.name,
    this.ins,
    this.outs,
  });

  factory WarehouseData.fromJson(Map<String, dynamic> json) =>
      _$WarehouseDataFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseDataToJson(this);
}

@JsonSerializable()
class WarehouseIn {
  final int? id;
  final List<WarehouseProduct>? warehouseProduct;
  final String? warehouseStore;
  final int? quantityBefore;
  final int? quantityAfter;
  final int? quantity;
  @JsonKey(name: "in_date")
  final String? inDate;

  WarehouseIn({
    this.id,
    this.warehouseProduct,
    this.warehouseStore,
    this.quantityBefore,
    this.quantityAfter,
    this.quantity,
    this.inDate,
  });

  factory WarehouseIn.fromJson(Map<String, dynamic> json) =>
      _$WarehouseInFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseInToJson(this);
}

@JsonSerializable()
class WarehouseOut {
  final int? id;
  final List<WarehouseProduct>? warehouseProduct;
  final String? warehouseStore;
  final int? quantityBefore;
  final int? quantityAfter;
  final int? quantity;
  @JsonKey(name: "out_date")
  final String? outDate;

  WarehouseOut({
    this.id,
    this.warehouseProduct,
    this.warehouseStore,
    this.quantityBefore,
    this.quantityAfter,
    this.quantity,
    this.outDate,
  });

  factory WarehouseOut.fromJson(Map<String, dynamic> json) =>
      _$WarehouseOutFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseOutToJson(this);
}

@JsonSerializable()
class WarehouseProduct {
  final int? id;
  final String? name;

  WarehouseProduct({
    this.id,
    this.name,
  });

  factory WarehouseProduct.fromJson(Map<String, dynamic> json) =>
      _$WarehouseProductFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseProductToJson(this);
}
