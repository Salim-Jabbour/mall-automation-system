import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  final List<FavoriteDataResponse>? data;
  final String? message;

  FavoriteModel({
    this.data,
    this.message,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}

@JsonSerializable()
class FavoriteDataResponse {
  final int? id;
  final String? name;
  final String? description;
  final int? quantity;
  @JsonKey(name: 'store_id')
  final int? storeId;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  final int? price;
  final String? image;

  FavoriteDataResponse(
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.storeId,
    this.categoryId,
    this.price,
    this.image,
  );

  factory FavoriteDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteDataResponseToJson(this);
}
