// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcome_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseProduct _$WarehouseProductFromJson(Map<String, dynamic> json) =>
    WarehouseProduct(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WarehouseProductToJson(WarehouseProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OutcomeDataModel _$OutcomeDataModelFromJson(Map<String, dynamic> json) =>
    OutcomeDataModel(
      id: json['id'] as int?,
      warehouseProduct: (json['warehouse_product'] as List<dynamic>?)
          ?.map((e) => WarehouseProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      warehouseStore: json['warehouse_store'] as String?,
      quantityBefore: json['quantity_before'] as int?,
      quantityAfter: json['quantity_after'] as int?,
      outDate: json['out_date'] as String?,
    );

Map<String, dynamic> _$OutcomeDataModelToJson(OutcomeDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouse_product': instance.warehouseProduct,
      'warehouse_store': instance.warehouseStore,
      'quantity_before': instance.quantityBefore,
      'quantity_after': instance.quantityAfter,
      'out_date': instance.outDate,
    };

OutcomeModel _$OutcomeModelFromJson(Map<String, dynamic> json) => OutcomeModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OutcomeDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OutcomeModelToJson(OutcomeModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };
