import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'feature/auth/data/data_source/login_local_data_source.dart';
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
import 'feature/city_and_advertisement/data/data_source/advertisements_remote_data_source.dart';
import 'feature/city_and_advertisement/data/data_source/advertisment_local_data_source.dart';
import 'feature/city_and_advertisement/data/data_source/city_local_data_source.dart';
import 'feature/city_and_advertisement/data/data_source/city_remote_data_source.dart';
import 'feature/city_and_advertisement/data/repo/advertisement_repo_impl.dart';
import 'feature/city_and_advertisement/data/repo/city_repo_impl.dart';
import 'feature/city_and_advertisement/domain/repo/advertisement_repo.dart';
import 'feature/city_and_advertisement/domain/repo/city_repo.dart';
import 'feature/city_and_advertisement/domain/use_case/advertisement_use_case.dart';
import 'feature/city_and_advertisement/domain/use_case/city_use_case.dart';
import 'feature/city_and_advertisement/presentation/bloc/advertisement_bloc.dart';
import 'feature/city_and_advertisement/presentation/bloc/city_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc
  sl.registerFactory(() => LogInBloc(loginUseCase: sl(),));
  sl.registerFactory(() => OtpBloc(otpUseCase: sl(),));
  sl.registerFactory(() => CityBloc( getCitiesUseCase: sl(),));
  sl.registerFactory(() => AdvertisementBloc( getAdvertisementsUseCase: sl(),));


  //! UseCases
  sl.registerLazySingleton(() => LogInWithMobileUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));
  sl.registerLazySingleton(() => GetCitiesUseCase(sl()));
  sl.registerLazySingleton(() => GetAdvertisementsUseCase(sl())); 


  //! Repository
  sl.registerLazySingleton<LogInRepo>(() => LogInRepoImpl(
    logInRemoteDataSource: sl(), logInLocalDataSource: sl(), networkInfo: sl(),
  ));

  sl.registerLazySingleton<OtpRepo>(() => OtpRepoImpl(
    otpRemoteDataSource: sl(), otpLocalDataSource: sl(), networkInfo: sl(),
  ));
  sl.registerLazySingleton<CityRepo>(() => CityRepoImpl(
    cityRemoteDataSource: sl(), cityLocalDataSource: sl(), networkInfo: sl(), 
  ));
  sl.registerLazySingleton<AdvertisementRepo>(() => AdvertisementRepoImpl(
    advertisementRemoteDataSource: sl(), advertisementLocalDataSource: sl(), networkInfo: sl(),
  ));

  //! Data sources
  sl.registerLazySingleton<LogInRemoteDataSource>(() => LogInRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<OtpRemoteDataSource>(() => OtpRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LogInLocalDataSource>(() => LogInLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<OtpLocalDataSource>(() => OtpLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<CityRemoteDataSource>(() => CityRemoteDataSourceImpl(client: sl()),);
  sl.registerLazySingleton<CityLocalDataSource>(() => CityLocalDataSourceImpl(sharedPreferences: sl()),);
  sl.registerLazySingleton<AdvertisementRemoteDataSource>(() => AdvertisementRemoteDataSourceImpl(client: sl()),);
  sl.registerLazySingleton<AdvertisementLocalDataSource>(() => AdvertisementLocalDataSourceImpl(sharedPreferences: sl()),);

  //!core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
}
