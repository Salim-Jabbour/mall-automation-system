// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_extra_space_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

DataItem _$DataItemFromJson(Map<String, dynamic> json) => DataItem(
      json['id'] as int,
      json['new_space'] as int,
      (json['user'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['warehouse_manager_approval'] as String,
      json['admin_approval'] as String,
    );

Map<String, dynamic> _$DataItemToJson(DataItem instance) => <String, dynamic>{
      'id': instance.id,
      'new_space': instance.newSpace,
      'user': instance.user,
      'warehouse_manager_approval': instance.warehouseManagerApproval,
      'admin_approval': instance.adminApproval,
    };

WarehouseExtraSpaceRequestsModel _$WarehouseExtraSpaceRequestsModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseExtraSpaceRequestsModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$WarehouseExtraSpaceRequestsModelToJson(
        WarehouseExtraSpaceRequestsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };
