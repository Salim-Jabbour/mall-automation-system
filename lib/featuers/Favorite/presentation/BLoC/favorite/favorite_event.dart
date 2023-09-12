part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteGetFavoriteProductsEvent extends FavoriteEvent {
  final String token;

  FavoriteGetFavoriteProductsEvent({required this.token});
}

class FavoriteRemoveFavoriteProductsEvent extends FavoriteEvent {
  final String token;
  final int id;
  FavoriteRemoveFavoriteProductsEvent({
    required this.token,
    required this.id,
  });
}
