// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

investorBillsModel _$investorBillsModelFromJson(Map<String, dynamic> json) =>
    investorBillsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              investorBillsDataModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$investorBillsModelToJson(investorBillsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

investorBillsDataModels _$investorBillsDataModelsFromJson(
        Map<String, dynamic> json) =>
    investorBillsDataModels(
      id: json['id'] as int?,
      price: json['price'] as int?,
      quantity: json['quantity'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$investorBillsDataModelsToJson(
        investorBillsDataModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
      'name': instance.name,
    };

InvestorProductModel _$InvestorProductModelFromJson(
        Map<String, dynamic> json) =>
    InvestorProductModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              InvestorDataProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InvestorProductModelToJson(
        InvestorProductModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

InvestorDataProductModel _$InvestorDataProductModelFromJson(
        Map<String, dynamic> json) =>
    InvestorDataProductModel(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      storeId: json['storeId'] as int?,
      price: json['price'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$InvestorDataProductModelToJson(
        InvestorDataProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'storeId': instance.storeId,
      'price': instance.price,
      'image': instance.image,
    };
