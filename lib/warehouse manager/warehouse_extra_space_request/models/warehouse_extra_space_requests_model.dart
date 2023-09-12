import 'package:json_annotation/json_annotation.dart';

part 'warehouse_extra_space_requests_model.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String? name;

  User(this.id, this.name);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class DataItem {
  final int id;
  @JsonKey(name: 'new_space')
  final int newSpace;
  final List<User> user;
  @JsonKey(name: 'warehouse_manager_approval')
  final String warehouseManagerApproval;
  @JsonKey(name: 'admin_approval')
  final String adminApproval;

  DataItem(this.id, this.newSpace, this.user, this.warehouseManagerApproval,
      this.adminApproval);

  factory DataItem.fromJson(Map<String, dynamic> json) =>
      _$DataItemFromJson(json);
  Map<String, dynamic> toJson() => _$DataItemToJson(this);
}

@JsonSerializable()
class WarehouseExtraSpaceRequestsModel {
  final List<DataItem>? data;
  final String? message;

  WarehouseExtraSpaceRequestsModel(this.data, this.message);

  factory WarehouseExtraSpaceRequestsModel.fromJson(
          Map<String, dynamic> json) =>
      _$WarehouseExtraSpaceRequestsModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$WarehouseExtraSpaceRequestsModelToJson(this);
}
