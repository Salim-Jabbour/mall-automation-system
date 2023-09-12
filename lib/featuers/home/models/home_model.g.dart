// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      message: json['message'] as String?,
      productDataModel: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'data': instance.productDataModel,
      'message': instance.message,
    };

ProductDataModel _$ProductDataModelFromJson(Map<String, dynamic> json) =>
    ProductDataModel(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      size: (json['size'] as List<dynamic>?)?.map((e) => e as String).toList(),
      color:
          (json['color'] as List<dynamic>?)?.map((e) => e as String).toList(),
      width: (json['width'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      length: json['length'],
      name: json['name'] as String?,
      description: json['description'] as String?,
      storeId: json['storeId'] as int?,
      store: (json['store'] as List<dynamic>?)
          ?.map((e) => StoreForProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String?,
      discountPercent: (json['discount_percent'] as num?)?.toDouble(),
      priceAfterDiscount: (json['price_after_discount'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductDataModelToJson(ProductDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'size': instance.size,
      'color': instance.color,
      'width': instance.width,
      'weight': instance.weight,
      'length': instance.length,
      'height': instance.height,
      'name': instance.name,
      'description': instance.description,
      'storeId': instance.storeId,
      'store': instance.store,
      'price': instance.price,
      'image': instance.image,
      'discount_percent': instance.discountPercent,
      'price_after_discount': instance.priceAfterDiscount,
    };

StoreForProductModel _$StoreForProductModelFromJson(
        Map<String, dynamic> json) =>
    StoreForProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StoreForProductModelToJson(
        StoreForProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      message: json['message'] as String?,
      categoryDataModel: json['data'] == null
          ? null
          : CategoryDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'data': instance.categoryDataModel,
      'message': instance.message,
    };

CategoryDataModel _$CategoryDataModelFromJson(Map<String, dynamic> json) =>
    CategoryDataModel(
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      discount: json['discount'] as List<dynamic>,
    );

Map<String, dynamic> _$CategoryDataModelToJson(CategoryDataModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'discount': instance.discount,
    };

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      message: json['message'] as String?,
      storeDataModel: (json['data'] as List<dynamic>?)
          ?.map((e) => StoreDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'data': instance.storeDataModel,
      'message': instance.message,
    };

StoreDataModel _$StoreDataModelFromJson(Map<String, dynamic> json) =>
    StoreDataModel(
      id: json['id'] as int?,
      openTime: json['openTime'] as int?,
      closeTime: json['closeTime'] as int?,
      name: json['name'] as String?,
      storeSpace: json['storeSpace'] as int?,
      floor: json['floor'] as int?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      warehouseSpace: json['warehouseSpace'] as List<dynamic>?,
    );

Map<String, dynamic> _$StoreDataModelToJson(StoreDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'name': instance.name,
      'storeSpace': instance.storeSpace,
      'floor': instance.floor,
      'type': instance.type,
      'image': instance.image,
      'warehouseSpace': instance.warehouseSpace,
    };
