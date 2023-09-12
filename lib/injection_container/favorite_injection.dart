import 'package:get_it/get_it.dart';

import '../core/network/network_info.dart';

import '../featuers/Favorite/data/datasource/remote/favorite_remote_data_source.dart';
import '../featuers/Favorite/presentation/BLoC/favorite/favorite_bloc.dart';
import '../featuers/Favorite/repository/favorite_repository.dart';
import '../featuers/Favorite/repository/favorite_repository_impl.dart';
import 'auth_injection.dart';

Future<void> favoriteInjection() async {
  //remote data source
  locator.registerLazySingleton<FavoriteRemoteDataSource>(
    () => FavoriteRemoteDataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(
      locator.get<FavoriteRemoteDataSource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => FavoriteBloc(
      locator.get<FavoriteRepository>(),
    ),
  );
}
