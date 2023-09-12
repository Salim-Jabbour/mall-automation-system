import 'package:jessy_mall/delivery%20manager/features/home/data/datasource/delivery_home_remote_datasource.dart';
import 'package:jessy_mall/delivery%20manager/features/home/presentation/bloc/delivery_manager_bloc/dilevery_manager_home_bloc.dart';
import 'package:jessy_mall/delivery%20manager/features/home/repository/delivery_home_repository.dart';

import '../core/network/network_info.dart';
import '../delivery manager/features/home/repository/delivery_home_repository_impl.dart';
import 'auth_injection.dart';

Future<void> dileveryInjection() async {
  //remote data source
  locator.registerLazySingleton<DeliveryHomeRemoteDataSource>(
    () => DeliveryHomeRemoteDataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<DeliveryHomeRepository>(
    () => DeliveryHomeRepositoryImpl(
      locator.get<DeliveryHomeRemoteDataSource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => DileveryManagerHomeBloc(
      locator.get<DeliveryHomeRepository>(),
    ),
  );
}
