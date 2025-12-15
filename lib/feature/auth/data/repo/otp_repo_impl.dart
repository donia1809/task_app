import 'package:dartz/dartz.dart';
import 'package:task_app/core/error/failure.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/otp_entity.dart';
import '../../domain/repo/otp_repo.dart';
import '../data_source/otp_local_data_source.dart';
import '../data_source/otp_remote_data_source.dart';

class OtpRepoImpl extends OtpRepo {
  final OtpRemoteDataSource otpRemoteDataSource;
  final OtpLocalDataSource otpLocalDataSource;
  final NetworkInfo networkInfo;

  OtpRepoImpl({
    required this.otpRemoteDataSource,
    required this.otpLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, OtpEntity>> verifyOtp(String otp, String accessToken) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await otpRemoteDataSource.verifyOtp(otp, accessToken);
        await otpLocalDataSource.cacheOtp(otp, accessToken);
        return Right(result);
      } on UnAuthorizedException {
        return Left(UnAuthorizedFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on NetworkException {
        return Left(NetworkFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, Map<String, String>>> getCachedOtp() async {
    try {
      final data = await otpLocalDataSource.getCachedOtp();
      return Right(data);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  Future<void> clearCachedOtp() async {
    await otpLocalDataSource.clearOtp();
  }
}
