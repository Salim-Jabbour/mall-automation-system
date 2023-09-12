part of 'warehouse_homepage_products_bloc.dart';

@immutable
abstract class WarehouseHomepageProductsEvent {}

class WarehouseHomePageGetProductsEvent extends WarehouseHomepageProductsEvent {
  final String token;

  WarehouseHomePageGetProductsEvent({required this.token});
}

class WarehouseHomePageGetProductDetailsEvent
    extends WarehouseHomepageProductsEvent {
  final String token, productId;

  WarehouseHomePageGetProductDetailsEvent({
    required this.token,
    required this.productId,
  });
}
