// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSearchDataModel _$HomeSearchDataModelFromJson(Map<String, dynamic> json) =>
    HomeSearchDataModel(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      category: json['category'] as String?,
      storeId: json['store_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$HomeSearchDataModelToJson(
        HomeSearchDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'category': instance.category,
      'store_id': instance.storeId,
      'price': instance.price,
      'image': instance.image,
      'name': instance.name,
    };

HomeSearchModel _$HomeSearchModelFromJson(Map<String, dynamic> json) =>
    HomeSearchModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => HomeSearchDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$HomeSearchModelToJson(HomeSearchModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };
