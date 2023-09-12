import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/Auth/data/datasource/local/auth_local_data_source.dart';
import 'package:jessy_mall/featuers/Auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/Auth/repository/auth_repository.dart';
import 'package:jessy_mall/featuers/Auth/repository/auth_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/network_info.dart';


GetIt locator = GetIt.instance;

Future<void> authInjection() async {
  //bloc
  locator.registerFactory(
    () => AuthBloc(locator.get<AuthRepository>()),
  );

  //Repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      
      locator.get<AuthRemoteDataSource>(),
      locator.get<AuthLocalDataSource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //Data sources
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(locator.get()));

  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(locator.get()),
  );


}
