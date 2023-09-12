// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      json['data'] == null
          ? null
          : CartOrderModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String?,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

CartOrderModel _$CartOrderModelFromJson(Map<String, dynamic> json) =>
    CartOrderModel(
      cart_orders: (json['cart_orders'] as List<dynamic>?)
          ?.map((e) => CartOrderDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartOrderModelToJson(CartOrderModel instance) =>
    <String, dynamic>{
      'cart_orders': instance.cart_orders,
    };

CartOrderDataModel _$CartOrderDataModelFromJson(Map<String, dynamic> json) =>
    CartOrderDataModel(
      id: json['id'] as int?,
      storeProduct: json['storeProduct'] == null
          ? null
          : StoreProductModel.fromJson(
              json['storeProduct'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CartOrderDataModelToJson(CartOrderDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storeProduct': instance.storeProduct,
      'quantity': instance.quantity,
    };

StoreProductModel _$StoreProductModelFromJson(Map<String, dynamic> json) =>
    StoreProductModel(
      quantity: json['quantity'] as int?,
      name: json['name'] as String?,
      store_name: json['store_name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$StoreProductModelToJson(StoreProductModel instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'name': instance.name,
      'store_name': instance.store_name,
      'price': instance.price,
      'image': instance.image,
    };
