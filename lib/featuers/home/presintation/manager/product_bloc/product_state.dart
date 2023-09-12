part of 'product_bloc.dart';

@immutable
class ProductState {}

final class ProductInitial extends ProductState {}

class CategroyGetSuccess extends ProductState {
  CategoryModel categoryModel;
  CategroyGetSuccess({required this.categoryModel});
}

class CategoryLoading extends ProductState {}

class CategoryGetInfoFailed extends ProductState {
  final Failure faliuer;
  CategoryGetInfoFailed({required this.faliuer});
}

class ProductGetSuccess extends ProductState {
  ProductModel productModel;
  ProductGetSuccess({required this.productModel});
}

class ProductLoading extends ProductState {}

class ProductGetInfoFailed extends ProductState {
  final Failure faliuer;
  ProductGetInfoFailed({required this.faliuer});
}

class ProductAddToCartSuccess extends ProductState {}

class ProductAddToCartLoading extends ProductState {}

class ProductAddToCartFailed extends ProductState {
  final Failure faliuer;
  ProductAddToCartFailed({required this.faliuer});
}


class ProductAddToFavoriteSuccess extends ProductState {}

class ProductAddToFavoriteLoading extends ProductState {}

class ProductAddToFavoriteFailed extends ProductState {
  final Failure faliuer;
  ProductAddToFavoriteFailed({required this.faliuer});
}