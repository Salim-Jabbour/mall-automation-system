import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart'; // This will be generated

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'data')
  final List<ProductDataModel>? productDataModel;
  final String? message;
  ProductModel({this.message, this.productDataModel});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductDataModel {
  final int? id;
  final int? quantity;
  final List<String>? size;
  final List<String>? color;
  final double? width;
  final double? weight;
  var length;
  final double? height;
  final String? name;
  final String? description;
  final int? storeId;
  final List<StoreForProductModel>? store;
  final double? price;
  final String? image;
  @JsonKey(name: 'discount_percent')
  final double? discountPercent;

  @JsonKey(name: 'price_after_discount')
  final double? priceAfterDiscount;
  ProductDataModel(
      {this.id,
      this.quantity,
      this.size,
      this.color,
      this.width,
      this.weight,
      this.length,
      this.name,
      this.description,
      this.storeId,
      this.store,
      this.price,
      this.image,
      this.discountPercent,
      this.priceAfterDiscount,
      this.height});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataModelToJson(this);
}

@JsonSerializable()
class StoreForProductModel {
  final int? id;
  final String? name;

  StoreForProductModel({
    this.id,
    this.name,
  });

  factory StoreForProductModel.fromJson(Map<String, dynamic> json) =>
      _$StoreForProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreForProductModelToJson(this);
}

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'data')
  final CategoryDataModel? categoryDataModel;
  final String? message;
  CategoryModel({this.message, this.categoryDataModel});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryDataModel {
  final List<String> category;
  final List<dynamic>
      discount; // Change this type if there's a specific structure

  CategoryDataModel({
    required this.category,
    required this.discount,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataModelToJson(this);
}

@JsonSerializable()
class StoreModel {
  @JsonKey(name: 'data')
  final List<StoreDataModel>? storeDataModel;
  final String? message;
  StoreModel({this.message, this.storeDataModel});

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}

@JsonSerializable()
class StoreDataModel {
  final int? id;
  final int? openTime;
  final int? closeTime;
  final String? name;
  final int? storeSpace;
  final int? floor;
  final String? type;
  final String? image;
  final List<dynamic>? warehouseSpace;

  StoreDataModel({
    this.id,
    this.openTime,
    this.closeTime,
    this.name,
    this.storeSpace,
    this.floor,
    this.type,
    this.image,
    this.warehouseSpace,
  });

  factory StoreDataModel.fromJson(Map<String, dynamic> json) =>
      _$StoreDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDataModelToJson(this);
}
