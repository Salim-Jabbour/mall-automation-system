// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestStoreModel _$InvestStoreModelFromJson(Map<String, dynamic> json) =>
    InvestStoreModel(
      allStores: (json['data'] as List<dynamic>?)
          ?.map((e) => InvestStoreDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvestStoreModelToJson(InvestStoreModel instance) =>
    <String, dynamic>{
      'data': instance.allStores,
    };

InvestStoreDataModel _$InvestStoreDataModelFromJson(
        Map<String, dynamic> json) =>
    InvestStoreDataModel(
      id: json['id'] as int?,
      store_space: (json['store_space'] as num?)?.toDouble(),
      floor: (json['floor'] as num?)?.toDouble(),
      type: json['type'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      roomCount: (json['roomCount'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InvestStoreDataModelToJson(
        InvestStoreDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_space': instance.store_space,
      'floor': instance.floor,
      'type': instance.type,
      'price': instance.price,
      'roomCount': instance.roomCount,
      'height': instance.height,
      'width': instance.width,
      'length': instance.length,
    };
