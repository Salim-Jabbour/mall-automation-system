part of 'home_search_bloc.dart';

@immutable
abstract class HomeSearchState {}

final class HomeSearchInitial extends HomeSearchState {}

final class HomeSearchLoading extends HomeSearchState {}

final class HomeSearchFailed extends HomeSearchState {
  final Failure failure;

  HomeSearchFailed(this.failure);
}

final class HomeSearchSuccess extends HomeSearchState {
  final HomeSearchModel homeSearchModel;

  HomeSearchSuccess(this.homeSearchModel);
}
