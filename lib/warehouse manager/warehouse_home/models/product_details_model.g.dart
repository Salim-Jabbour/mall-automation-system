// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      data: json['data'] == null
          ? null
          : WarehouseData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        ProductDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

WarehouseData _$WarehouseDataFromJson(Map<String, dynamic> json) =>
    WarehouseData(
      name: json['name'] as String?,
      ins: (json['ins'] as List<dynamic>?)
          ?.map((e) => WarehouseIn.fromJson(e as Map<String, dynamic>))
          .toList(),
      outs: (json['outs'] as List<dynamic>?)
          ?.map((e) => WarehouseOut.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WarehouseDataToJson(WarehouseData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ins': instance.ins,
      'outs': instance.outs,
    };

WarehouseIn _$WarehouseInFromJson(Map<String, dynamic> json) => WarehouseIn(
      id: json['id'] as int?,
      warehouseProduct: (json['warehouseProduct'] as List<dynamic>?)
          ?.map((e) => WarehouseProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      warehouseStore: json['warehouseStore'] as String?,
      quantityBefore: json['quantityBefore'] as int?,
      quantityAfter: json['quantityAfter'] as int?,
      quantity: json['quantity'] as int?,
      inDate: json['in_date'] as String?,
    );

Map<String, dynamic> _$WarehouseInToJson(WarehouseIn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouseProduct': instance.warehouseProduct,
      'warehouseStore': instance.warehouseStore,
      'quantityBefore': instance.quantityBefore,
      'quantityAfter': instance.quantityAfter,
      'quantity': instance.quantity,
      'in_date': instance.inDate,
    };

WarehouseOut _$WarehouseOutFromJson(Map<String, dynamic> json) => WarehouseOut(
      id: json['id'] as int?,
      warehouseProduct: (json['warehouseProduct'] as List<dynamic>?)
          ?.map((e) => WarehouseProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      warehouseStore: json['warehouseStore'] as String?,
      quantityBefore: json['quantityBefore'] as int?,
      quantityAfter: json['quantityAfter'] as int?,
      quantity: json['quantity'] as int?,
      outDate: json['out_date'] as String?,
    );

Map<String, dynamic> _$WarehouseOutToJson(WarehouseOut instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouseProduct': instance.warehouseProduct,
      'warehouseStore': instance.warehouseStore,
      'quantityBefore': instance.quantityBefore,
      'quantityAfter': instance.quantityAfter,
      'quantity': instance.quantity,
      'out_date': instance.outDate,
    };

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
