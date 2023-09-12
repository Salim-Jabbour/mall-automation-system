// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Investor _$InvestorFromJson(Map<String, dynamic> json) => Investor(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$InvestorToJson(Investor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

WarehouseOrdersDataModel _$WarehouseOrdersDataModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseOrdersDataModel(
      json['id'] as int?,
      (json['investor'] as List<dynamic>?)
          ?.map((e) => Investor.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['request_date'] as String?,
      json['status'] as String?,
      json['received'] as int?,
      json['quantity'],
    );

Map<String, dynamic> _$WarehouseOrdersDataModelToJson(
        WarehouseOrdersDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'investor': instance.investor,
      'request_date': instance.requestDate,
      'status': instance.status,
      'received': instance.received,
      'quantity': instance.quantity,
    };

WarehouseOrdersModel _$WarehouseOrdersModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseOrdersModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              WarehouseOrdersDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$WarehouseOrdersModelToJson(
        WarehouseOrdersModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };
