import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/otp_entity.dart';
import '../repo/otp_repo.dart';

class VerifyOtpUseCase{
  final OtpRepo otpRepo;

  VerifyOtpUseCase(this.otpRepo);

  Future<Either<Failure, OtpEntity>> call(String otp, String accessToken) async
  {
    return await otpRepo.verifyOtp(otp, accessToken);
  }
  
}
