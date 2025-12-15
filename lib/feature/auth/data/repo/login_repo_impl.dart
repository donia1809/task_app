import 'package:dartz/dartz.dart';
import 'package:task_app/core/error/failure.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repo/login_repo.dart';
import '../data_source/login_local_data_source.dart';
import '../data_source/login_remote_data_source.dart';

class LogInRepoImpl extends LogInRepo {
  //object from data source
  final LogInRemoteDataSource logInRemoteDataSource;
  final LogInLocalDataSource logInLocalDataSource;
  final NetworkInfo networkInfo;

  LogInRepoImpl({
    required this.logInRemoteDataSource,
    required this.logInLocalDataSource,
    required this.networkInfo,
  });
  //login from api
  @override
  Future<Either<Failure, LogInEntity>> logInWithMobile(String mobile) async {
    if (!await networkInfo.isConnected) {
      return Left(OfflineFailure());
    }

    try {
      final remoteUser = await logInRemoteDataSource.logInWithMobile(mobile);

      await logInLocalDataSource.cacheUser(remoteUser);
      return Right(remoteUser);
    } on ValidationException {
      return Left(ValidationFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  //auto login
  @override
  Future<Either<Failure, LogInEntity>> getCachedUser() async {
    try {
      final localUser = await logInLocalDataSource.getCachedUser();
      return Right(localUser);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
