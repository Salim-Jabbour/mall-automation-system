import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../core/network/network_info.dart';
import 'auth_injection.dart';



Future<void> globalInjection() async {
    // core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator.get()));

  //Extenal
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  // locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Connectivity());
}

