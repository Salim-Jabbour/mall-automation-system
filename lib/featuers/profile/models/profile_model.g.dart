// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      json['data'] == null
          ? null
          : ProfileDataModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'data': instance.profileDataModel,
      'message': instance.message,
    };

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      role: json['role'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => ProfileOrdersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      store: json['store'] as int?,
      stand: json['stand'] as int?,
    );

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'role': instance.role,
      'orders': instance.orders,
      'store': instance.store,
      'stand': instance.stand,
    };

ProfileOrdersModel _$ProfileOrdersModelFromJson(Map<String, dynamic> json) =>
    ProfileOrdersModel(
      json['id'] as int?,
      json['date'] as String?,
      json['total_quantity'] as String?,
      json['total_price'] as String?,
      json['delivered_status'] as int?,
      json['from_who'] as String?,
      (json['store_products'] as List<dynamic>?)
          ?.map((e) => ProfileOrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileOrdersModelToJson(ProfileOrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'total_quantity': instance.totalQuantity,
      'total_price': instance.totalPrice,
      'delivered_status': instance.deliveredStatus,
      'from_who': instance.fromWho,
      'store_products': instance.storeProducts,
    };

ProfileOrderDetails _$ProfileOrderDetailsFromJson(Map<String, dynamic> json) =>
    ProfileOrderDetails(
      json['id'] as int?,
      json['quantity'] as int?,
      json['name'] as String?,
      json['store_name'] as String?,
      json['price'] as int?,
      json['image'] as String?,
    );

Map<String, dynamic> _$ProfileOrderDetailsToJson(
        ProfileOrderDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'name': instance.name,
      'store_name': instance.storeName,
      'price': instance.price,
      'image': instance.image,
    };
