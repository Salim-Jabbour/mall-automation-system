import 'package:json_annotation/json_annotation.dart';

part 'warehouse_order_details_model.g.dart';

@JsonSerializable()
class Pivot {
  @JsonKey(name: 'warehouse_entry_request_id')
  final int? warehouseEntryRequestId;
  @JsonKey(name: 'warehouse_product_id')
  final int? warehouseProductId;
  final int? quantity;

  Pivot(this.warehouseEntryRequestId, this.warehouseProductId, this.quantity);

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
  Map<String, dynamic> toJson() => _$PivotToJson(this);
}

@JsonSerializable()
class WarehouseProduct {
  final String? name;
  final int? quantity;
  final Pivot? pivot;

  WarehouseProduct(this.name, this.quantity, this.pivot);

  factory WarehouseProduct.fromJson(Map<String, dynamic> json) =>
      _$WarehouseProductFromJson(json);
  Map<String, dynamic> toJson() => _$WarehouseProductToJson(this);
}

@JsonSerializable()
class WarehouseOrderDetailsDataModel {
  @JsonKey(name: 'warehouseProducts')
  final List<WarehouseProduct>? warehouseProducts;

  WarehouseOrderDetailsDataModel(this.warehouseProducts);

  factory WarehouseOrderDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseOrderDetailsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$WarehouseOrderDetailsDataModelToJson(this);
}

@JsonSerializable()
class WarehouseOrderDetailsModel {
  final WarehouseOrderDetailsDataModel? data;
  final String? message;

  WarehouseOrderDetailsModel(this.data, this.message);

  factory WarehouseOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseOrderDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$WarehouseOrderDetailsModelToJson(this);
}
