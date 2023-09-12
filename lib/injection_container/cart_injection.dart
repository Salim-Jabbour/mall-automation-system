import '../core/network/network_info.dart';
import '../featuers/cart/data/datasource/cart_remote_datasource.dart';
import '../featuers/cart/presentation/bloc/cart_bloc/cart_bloc.dart';
import '../featuers/cart/repository/cart_repository.dart';
import '../featuers/cart/repository/cart_repository_impl.dart';
import 'auth_injection.dart';

Future<void> cartInjection() async {
  //remote data source
  locator.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      locator.get<CartRemoteDataSource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => CartBloc(
      locator.get<CartRepository>(),
    ),
  );
}
