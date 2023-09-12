import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_home/models/product_details_model.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_home/models/product_model.dart';

import '../../../../core/errors/base_error.dart';
import '../../repository/warehouse_homepage_products.dart';
part 'warehouse_homepage_products_event.dart';
part 'warehouse_homepage_products_state.dart';

class WarehouseHomepageProductsBloc extends Bloc<WarehouseHomepageProductsEvent,
    WarehouseHomepageProductsState> {
  final WarehouseHomePageProductsRepository
      _warehouseHomePageProductsRepository;

  WarehouseHomepageProductsBloc(this._warehouseHomePageProductsRepository)
      : super(WarehouseHomepageProductsInitial()) {
    on<WarehouseHomePageGetProductsEvent>((event, emit) async {
      emit(WarehouseHomepageProductsLoading());
      final successOrFailuer = await _warehouseHomePageProductsRepository
          .getWareHouseHomePageProductsInfo(event.token);
      successOrFailuer.fold(
        (error) {
          emit(WarehouseHomepageProductsFailed(error));
        },
        (warehouseProductsModel) {
          emit(WarehouseHomepageProductsSuccess(warehouseProductsModel));
        },
      );
    });

    on<WarehouseHomePageGetProductDetailsEvent>((event, emit) async {
      emit(WarehouseHomepageProductsDetailsLoading());
      final successOrFailuer = await _warehouseHomePageProductsRepository
          .getWareHouseHomePageProductDetails(
              token: event.token, productID: event.productId);
      successOrFailuer.fold(
        (error) {
          emit(WarehouseHomepageProductsDetailsFailed(error));
        },
        (warehouseProductDetailsModel) {
          emit(WarehouseHomepageProductsDetailsSuccess(
              warehouseProductDetailsModel));
        },
      );
    });
  }
}
