part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartGetAllOrderSuccess extends CartState {
  final CartModel cartModel;

  CartGetAllOrderSuccess({required this.cartModel});
}

final class CartGetAllOrderFailed extends CartState {
  final Failure faliuer;

  CartGetAllOrderFailed({required this.faliuer});
}

// final class CartInitial extends CartState {}
final class CartRemoveOrderSuccess extends CartState {}

final class CartRemoveOrderFailed extends CartState {
  final Failure faliuer;

  CartRemoveOrderFailed(this.faliuer);
}

final class CartBuyAllOrderSuccess extends CartState {}

final class CartBuyAllOrderFailed extends CartState {
  final Failure faliuer;

  CartBuyAllOrderFailed(this.faliuer);
}
