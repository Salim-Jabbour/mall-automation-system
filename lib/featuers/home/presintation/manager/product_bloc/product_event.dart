part of 'product_bloc.dart';

@immutable
class ProductEvent {}

class CategoryRequested extends ProductEvent {
  final String token;
  final int storeId;
  CategoryRequested({required this.token, required this.storeId});
}

class ProductRequested extends ProductEvent {
  final String token;
  final int storeId;

  String? search;
  final String categoryName;
  ProductRequested(
      {required this.token,
      required this.storeId,
      required this.categoryName,
      this.search});
}

class ProductAddToCartRequested extends ProductEvent {
  final String token;
  final int productId;
  final int quantity;
  bool? isMarket = true;
  ProductAddToCartRequested(
      {required this.token,
      required this.productId,
      required this.quantity,
      this.isMarket});
}

class ProductAddToFavoriteRequested extends ProductEvent {
  final String token;
  final int productId;

  ProductAddToFavoriteRequested({
    required this.token,
    required this.productId,
  });
}
