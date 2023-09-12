import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/manage_store/presentation/bloc/edit_store_bloc/edit_store_bloc.dart';
import '../core/network/network_info.dart';
import '../featuers/manage_store/data/datasource/remote/edit_store_info_remote_datasource.dart';
import '../featuers/manage_store/repository/edit_store_info_repository.dart';
import '../featuers/manage_store/repository/edit_store_info_repository_impl.dart';
import 'auth_injection.dart';

Future<void> editStoreInjection() async {
  //remote data source
  locator.registerLazySingleton<EditStoreInfoRemoteDatasource>(
    () => EditStoreInfoRemoteDatasourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<EditStoreInfoRepository>(
    () => EditStoreInfoRepositoryImpl(
      locator.get<EditStoreInfoRemoteDatasource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => EditStoreBloc(
      locator.get<EditStoreInfoRepository>(),
    ),
  );
}
