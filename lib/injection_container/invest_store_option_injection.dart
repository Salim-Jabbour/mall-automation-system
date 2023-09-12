import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/investment_options/data/datasource/invest_store_option_remote_datasource.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/bloc/invest_option_bloc/invest_option_bloc.dart';
import 'package:jessy_mall/featuers/investment_options/repository/invest_option_repository.dart';
import 'package:jessy_mall/featuers/investment_options/repository/invest_option_repository_impl.dart';
import 'package:jessy_mall/featuers/manage_store/presentation/bloc/edit_store_bloc/edit_store_bloc.dart';
import '../core/network/network_info.dart';
import '../featuers/manage_store/data/datasource/remote/edit_store_info_remote_datasource.dart';
import '../featuers/manage_store/repository/edit_store_info_repository.dart';
import '../featuers/manage_store/repository/edit_store_info_repository_impl.dart';
import 'auth_injection.dart';

Future<void> investStoreOptionInjection() async {
  //remote data source
  locator.registerLazySingleton<InvestStoreOptionRemoteDatasource>(
    () => InvestStoreOptionRemoteDatasourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<InvestOptionRepository>(
    () => InvestOptionRepositoryImpl(
      locator.get<InvestStoreOptionRemoteDatasource>(),
      locator.get<NetworkInfo>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => InvestOptionBloc(
      locator.get<InvestOptionRepository>(),
    ),
  );
}
