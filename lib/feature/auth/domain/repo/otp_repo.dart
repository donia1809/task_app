import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/otp_entity.dart';

abstract class OtpRepo
{//use case functions
  Future<void>clearOtp();
  Future<Either<Failure, OtpEntity>> verifyOtp(String otp, String accessToken);
}