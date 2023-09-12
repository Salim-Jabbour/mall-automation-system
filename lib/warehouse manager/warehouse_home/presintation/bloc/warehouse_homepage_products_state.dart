part of 'warehouse_homepage_products_bloc.dart';

@immutable
abstract class WarehouseHomepageProductsState {}

class WarehouseHomepageProductsInitial extends WarehouseHomepageProductsState {}

//products
class WarehouseHomepageProductsLoading extends WarehouseHomepageProductsState {}

class WarehouseHomepageProductsFailed extends WarehouseHomepageProductsState {
  final Failure failure;

  WarehouseHomepageProductsFailed(this.failure);
}

class WarehouseHomepageProductsSuccess extends WarehouseHomepageProductsState {
  final ProductModel warehouseProductModel;

  WarehouseHomepageProductsSuccess(this.warehouseProductModel);
}

//products details
class WarehouseHomepageProductsDetailsLoading
    extends WarehouseHomepageProductsState {}

class WarehouseHomepageProductsDetailsFailed
    extends WarehouseHomepageProductsState {
  final Failure failure;

  WarehouseHomepageProductsDetailsFailed(this.failure);
}

class WarehouseHomepageProductsDetailsSuccess
    extends WarehouseHomepageProductsState {
  final ProductDetailsModel warehouseProductDetailsModel;

  WarehouseHomepageProductsDetailsSuccess(this.warehouseProductDetailsModel);
}
