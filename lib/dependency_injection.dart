import 'package:blindside/core/network/network_info.dart';
import 'package:blindside/features/login/data/datasource/login_datasource.dart';
import 'package:blindside/features/login/data/repository/login_repository_impl.dart';
import 'package:blindside/features/login/domain/repository/login_repository.dart';
import 'package:blindside/features/login/domain/usecase/login_usecase.dart';
import 'package:blindside/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:blindside/features/register/data/datasource/register_datasource.dart';
import 'package:blindside/features/register/data/repository/register_repository_impl.dart';
import 'package:blindside/features/register/domain/repository/register_repository.dart';
import 'package:blindside/features/register/domain/usecase/register_usecase.dart';
import 'package:blindside/features/register/presentation/bloc/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final dI = GetIt.instance;

Future<void> init() async {
  dI.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dI()));
  dI.registerLazySingleton(() => InternetConnectionChecker());
  dI.registerLazySingleton(() => FirebaseAuth.instance);
  registerInjection();
  loginInjection();
}

registerInjection() {
  dI.registerFactory(() => RegisterBloc(registerUseCase: dI()));
  dI.registerLazySingleton(() => RegisterUseCase(dI()));
  dI.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(dataSource: dI(), networkInfo: dI()));
  dI.registerLazySingleton<RegisterDataSource>(() => RegisterDataSourceImpl());
}

loginInjection() {
  dI.registerFactory(() => LoginBloc(loginUsecase: dI()));
  dI.registerLazySingleton(() => LoginUsecase(dI()));
  dI.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(dataSource: dI(), networkInfo: dI()));
  dI.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
}
