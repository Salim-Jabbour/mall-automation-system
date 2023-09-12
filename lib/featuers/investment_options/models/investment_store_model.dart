import 'package:json_annotation/json_annotation.dart';

part 'investment_store_model.g.dart';

@JsonSerializable()
class InvestStoreModel {
  @JsonKey(name: 'data')
  List<InvestStoreDataModel>? allStores;
  InvestStoreModel({
    this.allStores,
  });

  factory InvestStoreModel.fromJson(Map<String, dynamic> json) =>
      _$InvestStoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvestStoreModelToJson(this);
}

@JsonSerializable()
class InvestStoreDataModel {
  int? id;
  double? store_space;
  double? floor;
  String? type;
  double? price;
  double? roomCount;
  double? height;
  double? width;
  double? length;
  InvestStoreDataModel({
    this.id,
    this.store_space,
    this.floor,
    this.type,
    this.price,
    this.roomCount,
    this.height,
    this.width,
    this.length,
  });

  factory InvestStoreDataModel.fromJson(Map<String, dynamic> json) =>
      _$InvestStoreDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvestStoreDataModelToJson(this);
}
