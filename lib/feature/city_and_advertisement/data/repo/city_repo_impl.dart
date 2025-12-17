import 'package:dartz/dartz.dart';
import 'package:task_app/core/error/exceptions.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:task_app/core/network/network_info.dart';
import '../../domain/entity/city_entity.dart';
import '../../domain/repo/city_repo.dart';
import '../data_source/city_local_data_source.dart';
import '../data_source/city_remote_data_source.dart';

class CityRepoImpl implements CityRepo {
  final CityRemoteDataSource cityRemoteDataSource;
  final CityLocalDataSource cityLocalDataSource;
  final NetworkInfo networkInfo;

  CityRepoImpl({
    required this.cityRemoteDataSource,
    required this.cityLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    if (await networkInfo.isConnected) {
      try {
        final cities = await cityRemoteDataSource.getCities();
        await cityLocalDataSource.cacheCities(cities);
        return Right(cities);
      } on UnAuthorizedException {
        return Left(UnAuthorizedFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on NetworkException {
        return Left(NetworkFailure());
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, List<CityEntity>>> getCachedCities() async {
    try {
      final cities = await cityLocalDataSource.getCachedCities();
      return Right(cities);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }
}
