import 'package:json_annotation/json_annotation.dart';

part 'delivery_order_model.g.dart';

@JsonSerializable()
class DeliveryOrderModel {
  final List<DeliveryDataOrderModel>? data;
  final String? message;
  DeliveryOrderModel({
    this.data,
    this.message,
  });

  factory DeliveryOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOrderModelToJson(this);
}

@JsonSerializable()
class DeliveryDataOrderModel {
  final int? id;
  final String? date;
  final String? total_quantity;
  final String? total_price;
  final String? approved_status;
  final int? delivered_status;
  final String? location;
  final String? from_who;
  final List<DeliveryProductsDataModel>? store_products;
  DeliveryDataOrderModel({
    this.id,
    this.date,
    this.total_quantity,
    this.total_price,
    this.approved_status,
    this.delivered_status,
    this.location,
    this.from_who,
    this.store_products,
  });

  factory DeliveryDataOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDataOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryDataOrderModelToJson(this);
}

@JsonSerializable()
class DeliveryProductsDataModel {
  final int? id;
  final int? quantity;
  final String? name;
  final String? image;
  final String? store_name;
  DeliveryProductsDataModel({
    this.id,
    this.quantity,
    this.name,
    this.image,
    this.store_name,
  });

  factory DeliveryProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryProductsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryProductsDataModelToJson(this);
}
