part of 'upload_excel_file_bloc.dart';

@immutable
abstract class UploadExcelFileState {}

class UploadExcelFileInitial extends UploadExcelFileState {}

class UploadExcelFileLoading extends UploadExcelFileState {}

class UploadExcelFileFailed extends UploadExcelFileState {
  final Failure failure;

  UploadExcelFileFailed(this.failure);
}

class UploadExcelFileSuccess extends UploadExcelFileState {
  final String successMessage;

  UploadExcelFileSuccess(this.successMessage);
}
