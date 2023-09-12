import '../core/network/network_info.dart';
import '../warehouse manager/warehouse_order/data/datasource/remote/warehouse_orders_remote_datasource.dart';
import '../warehouse manager/warehouse_order/presintation/bloc/warehouse_orders_bloc.dart';
import '../warehouse manager/warehouse_order/repository/warehouse_orders_repository.dart';
import '../warehouse manager/warehouse_order/repository/warehouse_orders_repository_impl.dart';
import 'auth_injection.dart';

Future<void> warehouseOrdersInjection() async {
  //remote data source
  locator.registerLazySingleton<WarehouseOrdersRemoteDataSource>(
    () => WarehouseOrdersRemoteDataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<WarehouseOrdersRepository>(
    () => WarehouseOrdersRepositoryImpl(
      locator.get<WarehouseOrdersRemoteDataSource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => WarehouseOrdersBloc(
      locator.get<WarehouseOrdersRepository>(),
    ),
  );
}
