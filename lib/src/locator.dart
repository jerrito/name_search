import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:trial_project/core/network/network_connection.dart';
import 'package:trial_project/core/urls/url.dart';
import 'package:trial_project/src/data/datasource/remoteds.dart';
import 'package:trial_project/src/data/repository/name_repository_impl.dart';
import 'package:trial_project/src/domain/repository/name_repository.dart';
import 'package:trial_project/src/domain/usecases/get_name.dart';
import 'package:trial_project/src/presentation/bloc/name_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void getDependencies() {
//bloc

  locator.registerFactory(() => NameBloc(getName: locator()));

//usecases

  locator.registerLazySingleton(() => GetName(repository: locator()));

//repository

  locator.registerLazySingleton<NameRepository>(() =>
      NameRepositoryImpl(networkInfo: locator(), remoteDatasource: locator()));

//datasources

  locator.registerLazySingleton<NameRemoteDatasource>(
    () => NameRemoteDatasourceImpl(
      url: locator(),
      client: locator(),
      networkInfo: locator(),
    ),
  );

  locator.registerLazySingleton(() => URL());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: locator()));
  locator.registerLazySingleton(() => DataConnectionChecker());
}
