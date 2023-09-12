import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/base_error.dart';
import '../../models/home_search_model.dart';
import '../../repository/home_search_repository.dart';

part 'home_search_event.dart';
part 'home_search_state.dart';

class HomeSearchBloc extends Bloc<HomeSearchEvent, HomeSearchState> {
  final HomeSearchRepository _homeSearchRepository;
  HomeSearchBloc(this._homeSearchRepository) : super(HomeSearchInitial()) {
    on<GetHomeSearchedProductEvent>((event, emit) async {
      emit(HomeSearchLoading());
      final successOrFailuer = await _homeSearchRepository.searchProducts(
          event.token, event.searchedProducts);
      successOrFailuer.fold(
        (error) {
          emit(HomeSearchFailed(error));
        },
        (searchedProductModel) {
          emit(HomeSearchSuccess(searchedProductModel));
        },
      );
    });
  }
}
