import 'dart:io' as used;

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/base_error.dart';
import '../../../repository/profile_repository.dart';
import 'dart:io' as used;

part 'upload_excel_file_event.dart';
part 'upload_excel_file_state.dart';


class UploadExcelFileBloc
    extends Bloc<UploadExcelFileEvent, UploadExcelFileState> {
  final ProfileRepository _profileRepository;
  UploadExcelFileBloc(this._profileRepository)
      : super(UploadExcelFileInitial()) {
    on<UploadExcelEvent>((event, emit) async {
      emit(UploadExcelFileLoading());

      final successOrFailuer =
          await _profileRepository.uploadExcelFile(event.token, event.file);
      successOrFailuer.fold((error) {
        emit(UploadExcelFileFailed(error));
      }, (successMessage) {
        emit(UploadExcelFileSuccess(successMessage));
      });
    });
  }
}
