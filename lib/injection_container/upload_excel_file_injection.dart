import '../core/network/network_info.dart';
import '../featuers/profile/data/datasource/remote/profile_remote_data_source.dart';
import '../featuers/profile/presentation/bloc/upload_excel_file/upload_excel_file_bloc.dart';
import '../featuers/profile/repository/profile_repository.dart';
import '../featuers/profile/repository/profile_repository_impl.dart';
import 'auth_injection.dart';

Future<void> uploadExcelFileInjection() async {


  //BLoC
  locator.registerFactory(
    () => UploadExcelFileBloc(
      locator.get(),
    ),
  );
}
