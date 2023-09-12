import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../models/favorite_model.dart';
import '../../../repository/favorite_repository.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _favoriteRepository;
  FavoriteBloc(this._favoriteRepository) : super(FavoriteInitial()) {
    on<FavoriteGetFavoriteProductsEvent>((event, emit) async {
      emit(FavoriteLoading());
      final successOrFailuer =
          await _favoriteRepository.getfavoriteProducts(event.token);
      successOrFailuer.fold(
        (error) {
          emit(FavoriteGetFavoriteProductFailed(faliuer: error));
        },
        (favoriteModel) {
          emit(FavoriteGetFavoriteProductSuccess(favoriteModel: favoriteModel));
        },
      );
    });
    on<FavoriteRemoveFavoriteProductsEvent>((event, emit) async {
      emit(FavoriteLoading());
      final successOrFailuer = await _favoriteRepository.removefavoriteProduct(
          event.token, event.id);
      successOrFailuer.fold(
        (error) {
          emit(FavoriteRemoveFavoriteProductFailed(faliuer: error));
        },
        (favoriteString) {
          emit(FavoriteRemoveFavoriteProductSuccess(
              favoriteString: favoriteString));
          emit(FavoriteInitial());
        },
      );
    });
  }
}
