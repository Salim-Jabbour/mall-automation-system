import 'package:json_annotation/json_annotation.dart';

part 'investor_model.g.dart';

@JsonSerializable()
class investorBillsModel {
  final List<investorBillsDataModels>? data;
  final String? message;

  investorBillsModel({this.data, this.message});

  factory investorBillsModel.fromJson(Map<String, dynamic> json) =>
      _$investorBillsModelFromJson(json);
  Map<String, dynamic> toJson() => _$investorBillsModelToJson(this);
}



@JsonSerializable()
class investorBillsDataModels {
  final int? id;
  final int? price;
  final int? quantity;

  final String? name;

  investorBillsDataModels({
    this.id,
    this.price,
    this.quantity,

    this.name
  });

  factory investorBillsDataModels.fromJson(Map<String, dynamic> json) =>
      _$investorBillsDataModelsFromJson(json);
  Map<String, dynamic> toJson() => _$investorBillsDataModelsToJson(this);
}

@JsonSerializable()
class InvestorProductModel {
  final List<InvestorDataProductModel>? data;
  final String? message;

  InvestorProductModel({
    required this.data,
    required this.message,
  });

  factory InvestorProductModel.fromJson(Map<String, dynamic> json) =>
      _$InvestorProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvestorProductModelToJson(this);
}

@JsonSerializable()
class InvestorDataProductModel {
  final int? id;
  final int? quantity;
  // final int? size;
  // final String? color;
  // final String? width;
  // final String? weight;
  // final int ?height;
  final String? name;
  final String? description;
  final String? category;
  final int? storeId;
  final int? price;
  final String? image;

  InvestorDataProductModel({
    this.id,
    this.quantity,
    this.name,
    this.description,
    this.category,
    this.storeId,
    this.price,
    this.image,
  });

  factory InvestorDataProductModel.fromJson(Map<String, dynamic> json) =>
      _$InvestorDataProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvestorDataProductModelToJson(this);
}
