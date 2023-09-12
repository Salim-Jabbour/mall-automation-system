// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wearhouse_investor_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WearhouseInvestorIncomModel _$WearhouseInvestorIncomModelFromJson(
        Map<String, dynamic> json) =>
    WearhouseInvestorIncomModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => WearhouseInvestorIncomDataModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$WearhouseInvestorIncomModelToJson(
        WearhouseInvestorIncomModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

WearhouseInvestorIncomDataModel _$WearhouseInvestorIncomDataModelFromJson(
        Map<String, dynamic> json) =>
    WearhouseInvestorIncomDataModel(
      id: json['id'] as int?,
      quantityBefore: json['quantity_before'] as int?,
      quantityAfter: json['quantity_after'] as int?,
      inDate: json['in_date'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WearhouseInvestorIncomDataModelToJson(
        WearhouseInvestorIncomDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity_before': instance.quantityBefore,
      'quantity_after': instance.quantityAfter,
      'in_date': instance.inDate,
      'name': instance.name,
    };

WearhouseInvestorOutcomModel _$WearhouseInvestorOutcomModelFromJson(
        Map<String, dynamic> json) =>
    WearhouseInvestorOutcomModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => WearhouseInvestorOutcomDataModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$WearhouseInvestorOutcomModelToJson(
        WearhouseInvestorOutcomModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

WearhouseInvestorOutcomDataModel _$WearhouseInvestorOutcomDataModelFromJson(
        Map<String, dynamic> json) =>
    WearhouseInvestorOutcomDataModel(
      id: json['id'] as int?,
      quantityBefore: json['quantity_before'] as int?,
      quantityAfter: json['quantity_after'] as int?,
      outDate: json['out_date'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WearhouseInvestorOutcomDataModelToJson(
        WearhouseInvestorOutcomDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity_before': instance.quantityBefore,
      'quantity_after': instance.quantityAfter,
      'out_date': instance.outDate,
      'name': instance.name,
    };

WearhouseInvestorProductModel _$WearhouseInvestorProductModelFromJson(
        Map<String, dynamic> json) =>
    WearhouseInvestorProductModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WearhouseInvestorProductDataModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WearhouseInvestorProductModelToJson(
        WearhouseInvestorProductModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

WearhouseInvestorProductDataModel _$WearhouseInvestorProductDataModelFromJson(
        Map<String, dynamic> json) =>
    WearhouseInvestorProductDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as int?,
      store: json['store'] == null
          ? null
          : StoreForWearhouseInvestorProduct.fromJson(
              json['store'] as Map<String, dynamic>),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$WearhouseInvestorProductDataModelToJson(
        WearhouseInvestorProductDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'store': instance.store,
      'image': instance.image,
    };

StoreForWearhouseInvestorProduct _$StoreForWearhouseInvestorProductFromJson(
        Map<String, dynamic> json) =>
    StoreForWearhouseInvestorProduct(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StoreForWearhouseInvestorProductToJson(
        StoreForWearhouseInvestorProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
