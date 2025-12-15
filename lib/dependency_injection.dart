import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/feature/auth/data/data_source/login_local_data_source.dart';
import 'core/network/network_info.dart';
import 'feature/auth/data/data_source/login_remote_data_source.dart';
import 'feature/auth/data/data_source/otp_local_data_source.dart';
import 'feature/auth/data/data_source/otp_remote_data_source.dart';
import 'feature/auth/data/repo/login_repo_impl.dart';
import 'feature/auth/data/repo/otp_repo_impl.dart';
import 'feature/auth/domain/repo/login_repo.dart';
import 'feature/auth/domain/repo/otp_repo.dart';
import 'feature/auth/domain/use_cases/login_with_mobile_use_case.dart';
import 'feature/auth/domain/use_cases/verify_otp_use_case.dart';
import 'feature/auth/presentation/bloc/login_bloc.dart';
import 'feature/auth/presentation/bloc/otp_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc
  sl.registerFactory(() => LogInBloc(loginUseCase: sl(),));

  sl.registerFactory(() => OtpBloc(otpUseCase: sl(),));

  //! UseCases
  sl.registerLazySingleton(() => LogInWithMobileUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));

  //! Repository
  sl.registerLazySingleton<LogInRepo>(() => LogInRepoImpl(
    logInRemoteDataSource: sl(), logInLocalDataSource: sl(), networkInfo: sl(),
  ));

  sl.registerLazySingleton<OtpRepo>(() => OtpRepoImpl(
    otpRemoteDataSource: sl(), otpLocalDataSource: sl(), networkInfo: sl(),
  ));

  //! Data sources
  sl.registerLazySingleton<LogInRemoteDataSource>(() => LogInRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<OtpRemoteDataSource>(() => OtpRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LogInLocalDataSource>(() => LogInLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<OtpLocalDataSource>(() => OtpLocalDataSourceImpl(sharedPreferences: sl()));

  //!core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
}
