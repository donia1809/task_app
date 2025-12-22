import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/otp_entity.dart';

abstract class OtpRepo {
  //use case functions
  Future<void> clearAccessToken();
  Future<void> cacheAccessToken(String accessToken);
  Future<Either<Failure, String>> getCachedAccessToken();
  Future<Either<Failure, OtpEntity>> verifyOtp(String otp, String accessToken);
}
