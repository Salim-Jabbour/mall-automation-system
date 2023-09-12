import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jessy_mall/featuers/home/models/home_model.dart';
import 'package:jessy_mall/featuers/home/repository/home_repository.dart';
import '../../../../../core/errors/base_error.dart';
part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final HomeRepository _homeRepository;
  StoreBloc(this._homeRepository) : super(StoreInitial()) {
    on<StoreRequested>((event, emit) async {
      emit(StoreLoading());
      final successOrFailuer = await _homeRepository.getStoresInType(
          token: event.token, type: event.type, search: event.search);
      successOrFailuer.fold((error) {
        emit(StoreGetInfoFailed(faliuer: error));
      }, (storeInfo) {

        emit(StoreGetInfoSuccess(storeModel: storeInfo));
      });
    });
  }
}
