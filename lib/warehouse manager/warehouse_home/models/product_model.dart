import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart'; // This is the generated file

@JsonSerializable()
class ProductModel {
  final List<ProductDataModel>? data;
  final String? message;

  ProductModel({
    this.data,
    this.message,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductDataModel {
  final int? id;
  final String? name;
  final String? description;
  final int? quantity;
  final Store? store;
  final String? image;

  ProductDataModel({
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.store,
    this.image,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataModelToJson(this);
}

@JsonSerializable()
class Store {
  final String? name;

  Store({
    this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
