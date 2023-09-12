// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      json['data'] == null
          ? null
          : StoreInfoModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String?,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'data': instance.storeInfoDataModel,
      'message': instance.message,
    };

StoreInfoModel _$StoreInfoModelFromJson(Map<String, dynamic> json) =>
    StoreInfoModel(
      id: json['id'] as int?,
      openTime: json['openTime'] as int?,
      closeTime: json['closeTime'] as int?,
      name: json['name'] as String?,
      name_en: json['name_en'] as String?,
      name_ar: json['name_ar'] as String?,
      store_space: json['store_space'] as int?,
      floor: json['floor'] as int?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      warehouse_space: json['warehouse_space'] as List<dynamic>?,
    );

Map<String, dynamic> _$StoreInfoModelToJson(StoreInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'name': instance.name,
      'name_en': instance.name_en,
      'name_ar': instance.name_ar,
      'store_space': instance.store_space,
      'floor': instance.floor,
      'type': instance.type,
      'image': instance.image,
      'warehouse_space': instance.warehouse_space,
    };
