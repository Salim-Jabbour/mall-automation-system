import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/dio.dart';



Future<void> dioInjection() async {
  final dio = await DioUtil.createDioInstance();

   GetIt.I.registerLazySingleton<Dio>(() => dio);
}

