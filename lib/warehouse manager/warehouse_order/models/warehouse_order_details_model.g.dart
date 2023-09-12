// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      json['warehouse_entry_request_id'] as int?,
      json['warehouse_product_id'] as int?,
      json['quantity'] as int?,
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'warehouse_entry_request_id': instance.warehouseEntryRequestId,
      'warehouse_product_id': instance.warehouseProductId,
      'quantity': instance.quantity,
    };

WarehouseProduct _$WarehouseProductFromJson(Map<String, dynamic> json) =>
    WarehouseProduct(
      json['name'] as String?,
      json['quantity'] as int?,
      json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WarehouseProductToJson(WarehouseProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'pivot': instance.pivot,
    };

WarehouseOrderDetailsDataModel _$WarehouseOrderDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseOrderDetailsDataModel(
      (json['warehouseProducts'] as List<dynamic>?)
          ?.map((e) => WarehouseProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WarehouseOrderDetailsDataModelToJson(
        WarehouseOrderDetailsDataModel instance) =>
    <String, dynamic>{
      'warehouseProducts': instance.warehouseProducts,
    };

WarehouseOrderDetailsModel _$WarehouseOrderDetailsModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseOrderDetailsModel(
      json['data'] == null
          ? null
          : WarehouseOrderDetailsDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
      json['message'] as String?,
    );

Map<String, dynamic> _$WarehouseOrderDetailsModelToJson(
        WarehouseOrderDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };
