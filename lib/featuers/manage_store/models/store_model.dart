import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  @JsonKey(name: 'data')
  StoreInfoModel? storeInfoDataModel;
  String? message;
  StoreModel(this.storeInfoDataModel, this.message);
  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}

@JsonSerializable()
class StoreInfoModel {
  final int? id;
  final int? openTime;
  final int? closeTime;
  final String? name;
  final String? name_en;
  final String? name_ar;
  final int? store_space;
  final int? floor;
  final String? type;
  final String? image;
  final List<dynamic>? warehouse_space;

  StoreInfoModel({
    this.id,
    this.openTime,
    this.closeTime,
    this.name,
    this.name_en,
    this.name_ar,
    this.store_space,
    this.floor,
    this.type,
    this.image,
    this.warehouse_space,
  });

  factory StoreInfoModel.fromJson(Map<String, dynamic> json) =>
      _$StoreInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreInfoModelToJson(this);
}
