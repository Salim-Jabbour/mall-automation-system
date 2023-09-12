// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FavoriteDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

FavoriteDataResponse _$FavoriteDataResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteDataResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      json['quantity'] as int?,
      json['store_id'] as int?,
      json['category_id'] as int?,
      json['price'] as int?,
      json['image'] as String?,
    );

Map<String, dynamic> _$FavoriteDataResponseToJson(
        FavoriteDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'store_id': instance.storeId,
      'category_id': instance.categoryId,
      'price': instance.price,
      'image': instance.image,
    };
