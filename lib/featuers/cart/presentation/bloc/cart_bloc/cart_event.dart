part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartGetAllOrderEvent extends CartEvent {
  final String token;
  CartGetAllOrderEvent({
    required this.token,
  });
}

class CartRemoveOrderFromCartEvent extends CartEvent {
  final String token;
  final int id;
  CartRemoveOrderFromCartEvent({
    required this.token,
    required this.id,
  });
}

class CartPostBuyAllOrderEvent extends CartEvent {
  final String token;
  final String cartOrderIds;
  final String addressLocation;
  CartPostBuyAllOrderEvent({
    required this.token,
    required this.cartOrderIds,
    required this.addressLocation,
  });
}
