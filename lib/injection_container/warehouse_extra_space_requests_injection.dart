import '../core/network/network_info.dart';
import '../warehouse manager/warehouse_extra_space_request/data/datasource/remote/warehouse_extra_space_requests_remote_datasource.dart';
import '../warehouse manager/warehouse_extra_space_request/presentation/bloc/warehouse_extra_space_requests_bloc.dart';
import '../warehouse manager/warehouse_extra_space_request/repository/warehouse_extra_space_requests_repository.dart';
import '../warehouse manager/warehouse_extra_space_request/repository/warehouse_extra_space_requests_repository_impl.dart';
import 'auth_injection.dart';

Future<void> warehouseExtraSpaceRequestsInjection() async {
  //remote data source
  locator.registerLazySingleton<WarehouseExtraSpaceRequestsRemotedataSource>(
    () => WarehouseExtraSpaceRequestsRemotedataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<WarehouseExtraSpaceRequestsRepository>(
    () => WarehouseExtraSpaceRequestsRepositoryImpl(
      locator.get<WarehouseExtraSpaceRequestsRemotedataSource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => WarehouseExtraSpaceRequestsBloc(
      locator.get<WarehouseExtraSpaceRequestsRepository>(),
    ),
  );
}
