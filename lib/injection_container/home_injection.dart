
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/home/data/datasource/remote/home_remote_data_source.dart';
import 'package:jessy_mall/featuers/home/presintation/manager/product_bloc/product_bloc.dart';
import 'package:jessy_mall/featuers/home/repository/home_repository.dart';
import 'package:jessy_mall/featuers/home/repository/home_repository_impl.dart';

import '../core/network/network_info.dart';
import '../featuers/home/presintation/manager/store_bloc/store_bloc.dart';

Future<void> homeInjection() async {
  //bloc
  GetIt.I.registerFactory(
    () => StoreBloc(GetIt.I.get<HomeRepository>()),
  );

    GetIt.I.registerFactory(
    () => ProductBloc(GetIt.I.get<HomeRepository>()),
  );


  //Repository
  GetIt.I.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      GetIt.I.get<HomeRemoteDataSource>(),
      GetIt.I.get<NetworkInfo>(),
    ),
  );

  //Data sources


  GetIt.I.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(GetIt.I.get()),
  );


}
