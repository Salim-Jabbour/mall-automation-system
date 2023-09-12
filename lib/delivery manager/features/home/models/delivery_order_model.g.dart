// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOrderModel _$DeliveryOrderModelFromJson(Map<String, dynamic> json) =>
    DeliveryOrderModel(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => DeliveryDataOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeliveryOrderModelToJson(DeliveryOrderModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

DeliveryDataOrderModel _$DeliveryDataOrderModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryDataOrderModel(
      id: json['id'] as int?,
      date: json['date'] as String?,
      total_quantity: json['total_quantity'] as String?,
      total_price: json['total_price'] as String?,
      approved_status: json['approved_status'] as String?,
      delivered_status: json['delivered_status'] as int?,
      location: json['location'] as String?,
      from_who: json['from_who'] as String?,
      store_products: (json['store_products'] as List<dynamic>?)
          ?.map((e) =>
              DeliveryProductsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeliveryDataOrderModelToJson(
        DeliveryDataOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'total_quantity': instance.total_quantity,
      'total_price': instance.total_price,
      'approved_status': instance.approved_status,
      'delivered_status': instance.delivered_status,
      'location': instance.location,
      'from_who': instance.from_who,
      'store_products': instance.store_products,
    };

DeliveryProductsDataModel _$DeliveryProductsDataModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryProductsDataModel(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      store_name: json['store_name'] as String?,
    );

Map<String, dynamic> _$DeliveryProductsDataModelToJson(
        DeliveryProductsDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'name': instance.name,
      'image': instance.image,
      'store_name': instance.store_name,
    };
