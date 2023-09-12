import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/base_error.dart';
import '../../models/warehouse_extra_space_requests_model.dart';
import '../../repository/warehouse_extra_space_requests_repository.dart';
part 'warehouse_extra_space_requests_event.dart';
part 'warehouse_extra_space_requests_state.dart';

class WarehouseExtraSpaceRequestsBloc extends Bloc<
    WarehouseExtraSpaceRequestsEvent, WarehouseExtraSpaceRequestsState> {
  final WarehouseExtraSpaceRequestsRepository
      _warehouseExtraSpaceRequestsRepository;
  WarehouseExtraSpaceRequestsBloc(this._warehouseExtraSpaceRequestsRepository)
      : super(WarehouseExtraSpaceRequestsInitial()) {
    on<WarehouseGetSpaceRequestsEvent>((event, emit) async {
      emit(WarehouseExtraSpaceRequestsLoading());
      final successOrFailuer = await _warehouseExtraSpaceRequestsRepository
          .getWareHouseSpaceRequests(event.token);
      successOrFailuer.fold(
        (error) {
          emit(WarehouseExtraSpaceRequestsFailed(failure: error));
        },
        (warehouseExtraSpaceRequestsModel) {
          emit(WarehouseExtraSpaceRequestsSuccess(
              warehouseExtraSpaceRequestsModel:
                  warehouseExtraSpaceRequestsModel));
        },
      );
    });

    on<WarehouseConfirmSpaceRequestEvent>((event, emit) async {
      emit(WarehouseExtraSpaceRequestsLoading());
      final successOrFailuer = await _warehouseExtraSpaceRequestsRepository
          .confirmSpaceRequest(event.token, event.id);
      successOrFailuer.fold(
        (error) {
          emit(WarehouseExtraSpaceRequestsFailed(failure: error));
        },
        (confirmMessage) {
          emit(WarehouseExtraSpaceConfirmRequest(confirmMessage));
          emit(WarehouseExtraSpaceRequestsInitial());
        },
      );
    });

    on<WarehouseRejectSpaceRequestEvent>((event, emit) async {
      emit(WarehouseExtraSpaceRequestsLoading());
      final successOrFailuer = await _warehouseExtraSpaceRequestsRepository
          .rejectSpaceRequest(event.token, event.id);
      successOrFailuer.fold(
        (error) {
          emit(WarehouseExtraSpaceRequestsFailed(failure: error));
        },
        (rejectMessage) {
          emit(WarehouseExtraSpaceRejectRequest(rejectMessage));
          emit(WarehouseExtraSpaceRequestsInitial());

        },
      );
    });
  }
}
