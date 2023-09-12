import 'package:json_annotation/json_annotation.dart';

// import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: 'data')
  ProfileDataModel? profileDataModel;
  String? message;
  ProfileModel(this.profileDataModel, this.message);
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class ProfileDataModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? role;
  final List<ProfileOrdersModel>? orders;
  final int? store;
  final int? stand;

  ProfileDataModel({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.role,
    this.orders,
    this.store,
    this.stand,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);
}

@JsonSerializable()
class ProfileOrdersModel {
  final int? id;
  final String? date;
  @JsonKey(name: "total_quantity")
  final String? totalQuantity;
  @JsonKey(name: "total_price")
  final String? totalPrice;
  @JsonKey(name: "delivered_status")
  final int? deliveredStatus;
  @JsonKey(name: "from_who")
  final String? fromWho;
  @JsonKey(name: "store_products")
  final List<ProfileOrderDetails>? storeProducts;

  ProfileOrdersModel(
    this.id,
    this.date,
    this.totalQuantity,
    this.totalPrice,
    this.deliveredStatus,
    this.fromWho,
    this.storeProducts,
  );

  factory ProfileOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileOrdersModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileOrdersModelToJson(this);
}

@JsonSerializable()
class ProfileOrderDetails {
  final int? id;
  final int? quantity;
  final String? name;
  @JsonKey(name: "store_name")
  final String? storeName;
  final int? price;
  final String? image;

  ProfileOrderDetails(
    this.id,
    this.quantity,
    this.name,
    this.storeName,
    this.price,
    this.image,
  );

  factory ProfileOrderDetails.fromJson(Map<String, dynamic> json) =>
      _$ProfileOrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileOrderDetailsToJson(this);
}
