import 'package:json_annotation/json_annotation.dart';

part 'wearhouse_investor_product.g.dart'; // This is the generated file from the build_runner

@JsonSerializable()
class WearhouseInvestorIncomModel {
  final List<WearhouseInvestorIncomDataModel>? data;
  final String? message;

  WearhouseInvestorIncomModel(this.data, this.message);

  factory WearhouseInvestorIncomModel.fromJson(Map<String, dynamic> json) =>
      _$WearhouseInvestorIncomModelFromJson(json);
  Map<String, dynamic> toJson() => _$WearhouseInvestorIncomModelToJson(this);
}

@JsonSerializable()
class WearhouseInvestorIncomDataModel {
  final int? id;
  @JsonKey(name: 'quantity_before')
  final int? quantityBefore;
  @JsonKey(name: 'quantity_after')
  final int? quantityAfter;
  @JsonKey(name: 'in_date')
  final String? inDate;
  final String? name;

  WearhouseInvestorIncomDataModel({
    this.id,
    this.quantityBefore,
    this.quantityAfter,
    this.inDate,
    this.name,
  });

  factory WearhouseInvestorIncomDataModel.fromJson(Map<String, dynamic> json) =>
      _$WearhouseInvestorIncomDataModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$WearhouseInvestorIncomDataModelToJson(this);
}

@JsonSerializable()
class WearhouseInvestorOutcomModel {
  final List<WearhouseInvestorOutcomDataModel>? data;
  final String? message;

  WearhouseInvestorOutcomModel(this.data, this.message);

  factory WearhouseInvestorOutcomModel.fromJson(Map<String, dynamic> json) =>
      _$WearhouseInvestorOutcomModelFromJson(json);
  Map<String, dynamic> toJson() => _$WearhouseInvestorOutcomModelToJson(this);
}

@JsonSerializable()
class WearhouseInvestorOutcomDataModel {
  final int? id;
  @JsonKey(name: 'quantity_before')
  final int? quantityBefore;
  @JsonKey(name: 'quantity_after')
  final int? quantityAfter;
  @JsonKey(name: 'out_date')
  final String? outDate;
  final String? name;

  WearhouseInvestorOutcomDataModel({
    this.id,
    this.quantityBefore,
    this.quantityAfter,
    this.outDate,
    this.name,
  });

  factory WearhouseInvestorOutcomDataModel.fromJson(
          Map<String, dynamic> json) =>
      _$WearhouseInvestorOutcomDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$WearhouseInvestorOutcomDataModelToJson(this);
}

@JsonSerializable()
class WearhouseInvestorProductModel {
  final List<WearhouseInvestorProductDataModel>? data;
  final String? message;
  WearhouseInvestorProductModel({this.data, this.message});

  factory WearhouseInvestorProductModel.fromJson(Map<String, dynamic> json) =>
      _$WearhouseInvestorProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$WearhouseInvestorProductModelToJson(this);
}

@JsonSerializable()
class WearhouseInvestorProductDataModel {
  final int? id;
  final String? name;
  final String? description;
  final int? quantity;
  final StoreForWearhouseInvestorProduct? store;
  final String? image;

  WearhouseInvestorProductDataModel({
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.store,
    this.image,
  });

  factory WearhouseInvestorProductDataModel.fromJson(
          Map<String, dynamic> json) =>
      _$WearhouseInvestorProductDataModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$WearhouseInvestorProductDataModelToJson(this);
}

@JsonSerializable()
class StoreForWearhouseInvestorProduct {
  final String? name;

  StoreForWearhouseInvestorProduct({this.name});

  factory StoreForWearhouseInvestorProduct.fromJson(
          Map<String, dynamic> json) =>
      _$StoreForWearhouseInvestorProductFromJson(json);
  Map<String, dynamic> toJson() =>
      _$StoreForWearhouseInvestorProductToJson(this);
}
