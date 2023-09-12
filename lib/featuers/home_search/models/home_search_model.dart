import 'package:json_annotation/json_annotation.dart';

part 'home_search_model.g.dart'; // This is the generated file

@JsonSerializable()
class HomeSearchDataModel {
  final int? id;
  final int? quantity;
  final String? category;
  @JsonKey(name: 'store_id')
  final int? storeId;
  final double? price;
  final String? image;
  final String? name;

  HomeSearchDataModel({
    this.id,
    this.quantity,
    this.category,
    this.storeId,
    this.price,
    this.image,
    this.name,
  });

  factory HomeSearchDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeSearchDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeSearchDataModelToJson(this);
}

@JsonSerializable()
class HomeSearchModel {
  final List<HomeSearchDataModel> data;
  final String? message;

  HomeSearchModel({
    required this.data,
    this.message,
  });

  factory HomeSearchModel.fromJson(Map<String, dynamic> json) =>
      _$HomeSearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeSearchModelToJson(this);
}
