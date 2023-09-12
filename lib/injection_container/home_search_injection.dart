import '../core/network/network_info.dart';
import '../featuers/home_search/data/datasource/remote/home_search_remote_data_source.dart';
import '../featuers/home_search/presentation/bloc/home_search_bloc.dart';
import '../featuers/home_search/repository/home_search_repository.dart';
import '../featuers/home_search/repository/home_search_repository_impl.dart';
import 'auth_injection.dart';

Future<void> homeSearchInjection() async {
  //remote data source
  locator.registerLazySingleton<HomeSearchRemoteDataSource>(
    () => HomeSearchRemoteDataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<HomeSearchRepository>(
    () => HomeSearchRepositoryImpl(
      locator.get<HomeSearchRemoteDataSource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  locator.registerFactory(
    () => HomeSearchBloc(
      locator.get<HomeSearchRepository>(),
    ),
  );
}
