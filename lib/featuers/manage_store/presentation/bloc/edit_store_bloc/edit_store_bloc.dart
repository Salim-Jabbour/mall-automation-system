import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/featuers/manage_store/models/store_model.dart';
import 'package:jessy_mall/featuers/manage_store/repository/edit_store_info_repository.dart';
part 'edit_store_event.dart';
part 'edit_store_state.dart';

class EditStoreBloc extends Bloc<EditStoreEvent, EditStoreState> {
  final EditStoreInfoRepository _editStoreInfoRepository;
  EditStoreBloc(this._editStoreInfoRepository) : super(EditStoreInitial()) {
    on<GetEditStoreEvent>((event, emit) async {
      emit(EditStoreloading());
      final successOrFailuer =
          await _editStoreInfoRepository.getStoreInfo(event.token);

      successOrFailuer.fold((error) {
        emit(EditStoreFailed(faliuer: error));
      }, (storeModel) {
        emit(EditStoreSuccess(storeModel: storeModel));
      });
    });
    on<UpdateEditStoreEvent>(
      (event, emit) async {
        emit(EditStoreloading());
        final successOrFailuer = await _editStoreInfoRepository.updateStoreInfo(
            id: event.id,
            token: event.token,
            name_ar: event.name_ar,
            name_en: event.name_en,
            openTime: event.openTime,
            closeTime: event.closeTime);

        successOrFailuer.fold((error) {
          emit(EditStoreFailed(faliuer: error));
        }, (updateStoreModel) async {
          emit(UpdateStoreSuccess(storeModelUpdated: updateStoreModel));
        });
      },
    );
  }
}
