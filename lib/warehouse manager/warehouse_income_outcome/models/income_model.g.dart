// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

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

IncomeDataModel _$IncomeDataModelFromJson(Map<String, dynamic> json) =>
    IncomeDataModel(
      id: json['id'] as int?,
      warehouseProduct: (json['warehouse_product'] as List<dynamic>?)
          ?.map((e) => WarehouseProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      warehouseStore: json['warehouse_store'] as String?,
      quantityBefore: json['quantity_before'] as int?,
      quantityAfter: json['quantity_after'] as int?,
      inDate: json['in_date'] as String?,
    );

Map<String, dynamic> _$IncomeDataModelToJson(IncomeDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouse_product': instance.warehouseProduct,
      'warehouse_store': instance.warehouseStore,
      'quantity_before': instance.quantityBefore,
      'quantity_after': instance.quantityAfter,
      'in_date': instance.inDate,
    };

IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) => IncomeModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => IncomeDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$IncomeModelToJson(IncomeModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };
