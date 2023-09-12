part of 'home_search_bloc.dart';

@immutable
abstract class HomeSearchEvent {}

class GetHomeSearchedProductEvent extends HomeSearchEvent {
  final String token, searchedProducts;

  GetHomeSearchedProductEvent(this.token, this.searchedProducts);
}
