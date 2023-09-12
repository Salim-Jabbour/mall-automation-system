import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final CartOrderModel? data;
  final String? message;

  CartModel(this.data, this.message);

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class CartOrderModel {
  final List<CartOrderDataModel>? cart_orders;
  CartOrderModel({
    this.cart_orders,
  });
  factory CartOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CartOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartOrderModelToJson(this);
}

@JsonSerializable()
class CartOrderDataModel {
  final int? id;
  final StoreProductModel? storeProduct;
  final double? quantity;
  // final StandProductModel? standProduct;
  CartOrderDataModel({
    // this.standProduct,
    this.id,
    this.storeProduct,
    this.quantity,
  });

  factory CartOrderDataModel.fromJson(Map<String, dynamic> json) =>
      _$CartOrderDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartOrderDataModelToJson(this);
}

@JsonSerializable()
class StoreProductModel {
  int? quantity;
  String? name;
  String? store_name;
  double? price;
  String? image;
  StoreProductModel({
    this.quantity,
    this.name,
    this.store_name,
    this.price,
    this.image,
  });

  factory StoreProductModel.fromJson(Map<String, dynamic> json) =>
      _$StoreProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreProductModelToJson(this);
}

//
// class StandProductModel {}
//TODO: cancel StandProductModel