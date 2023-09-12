import '../core/network/network_info.dart';
import '../warehouse manager/warehouse_income_outcome/data/datasource/remote/income_remote_data_source.dart';
import '../warehouse manager/warehouse_income_outcome/data/datasource/remote/outcome_remote_data_source.dart';
import '../warehouse manager/warehouse_income_outcome/presintation/bloc/warehouse_income_outcome_bloc.dart';
import '../warehouse manager/warehouse_income_outcome/repository/Income_repository.dart';
import '../warehouse manager/warehouse_income_outcome/repository/income_repository_impl.dart';
import '../warehouse manager/warehouse_income_outcome/repository/outcome_repository.dart';
import '../warehouse manager/warehouse_income_outcome/repository/outcome_repository_impl.dart';
import 'auth_injection.dart';

Future<void> incomeOutcomeInjection() async {
  //remote data source
  locator.registerLazySingleton<IncomeRemoteDataSource>(
    () => IncomeRemoteDataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<IncomeRepository>(
    () => IncomeRepositoryImpl(
      locator.get<NetworkInfo>(),
      locator.get<IncomeRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton<OutcomeRemoteDataSource>(
    () => OutcomeRemoteDataSourceImpl(locator.get()),
  );

  //repository
  locator.registerLazySingleton<OutcomeRepository>(
    () => OutcomeRepositoryImpl(
      locator.get<NetworkInfo>(),
      locator.get<OutcomeRemoteDataSource>(),
    ),
  );

  //BLoC
  locator.registerFactory(
    () => WarehouseIncomeOutcomeBloc(
      locator.get<IncomeRepository>(),
      locator.get<OutcomeRepository>(),
    ),
  );
}
