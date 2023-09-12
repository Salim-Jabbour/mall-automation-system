import '../core/network/network_info.dart';
import '../warehouse manager/warehouse_home/data/datasource/remote/warehouse_homepage_remote_data_source.dart';
import '../warehouse manager/warehouse_home/presintation/bloc/warehouse_homepage_products_bloc.dart';
import '../warehouse manager/warehouse_home/repository/warehouse_homepage_products.dart';
import '../warehouse manager/warehouse_home/repository/warehouse_homepage_products_impl.dart';
import 'auth_injection.dart';

Future<void> warehouseProductsInjection() async {
  //remote data source
  locator.registerLazySingleton<WarehouseHomePageRemoteDataSource>(
    () => WarehouseHomePageRemoteDataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<WarehouseHomePageProductsRepository>(
    () => WarehouseHomePageProductsRepositoryImpl(
      locator.get<WarehouseHomePageRemoteDataSource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => WarehouseHomepageProductsBloc(
      locator.get<WarehouseHomePageProductsRepository>(),
    ),
  );
}
