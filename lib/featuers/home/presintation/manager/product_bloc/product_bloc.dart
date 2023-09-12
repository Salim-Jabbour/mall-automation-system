
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jessy_mall/featuers/home/models/home_model.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../repository/home_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final HomeRepository _homeRepository;
  ProductBloc(this._homeRepository) : super(ProductInitial()) {
    on<CategoryRequested>((event, emit) async {
      emit(CategoryLoading());
      final successOrFailuer = await _homeRepository.getStoresCategory(
          token: event.token, storeId: event.storeId);
      successOrFailuer.fold((error) {
        emit(CategoryGetInfoFailed(faliuer: error));
      }, (categoryModel) {
        emit(CategroyGetSuccess(categoryModel: categoryModel));
      });
    });
        on<ProductRequested>((event, emit) async {
      emit(ProductLoading());
      final successOrFailuer = await _homeRepository.getProductInCategory(
          token: event.token, storeId: event.storeId,categoryName: event.categoryName,search: event.search);
      successOrFailuer.fold((error) {
        emit(ProductGetInfoFailed(faliuer: error));
      }, (productModel) {
        emit(ProductGetSuccess(productModel: productModel));
      });
    });

        on<ProductAddToCartRequested>((event, emit) async {
      emit(ProductAddToCartLoading());
      final successOrFailuer = await _homeRepository.addProductToCart(
          token: event.token, productId: event.productId,quantity: event.quantity,isMarket: event.isMarket);
      successOrFailuer.fold((error) {
        emit(ProductAddToCartFailed(faliuer: error));
      }, (t) {
        emit(ProductAddToCartSuccess());
      });
    });

          on<ProductAddToFavoriteRequested>((event, emit) async {
      emit(ProductAddToFavoriteLoading());
      final successOrFailuer = await _homeRepository.addProductToFavorite(
          token: event.token, productId: event.productId);
      successOrFailuer.fold((error) {
        emit(ProductAddToFavoriteFailed(faliuer: error));
      }, (t) {
        emit(ProductAddToFavoriteSuccess());
      });
    });
  }
}
