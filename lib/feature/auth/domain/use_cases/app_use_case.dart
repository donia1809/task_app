import 'package:dartz/dartz.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:task_app/feature/auth/domain/repo/otp_repo.dart';

class GetChachedAccessTokenUseCase {
  final OtpRepo otpRepo;
  GetChachedAccessTokenUseCase(this.otpRepo);

  Future<Either<Failure, String>> call() async {
    return await otpRepo.getCachedAccessToken();
  }
}

class ClearAccessTokenUseCase {
  final OtpRepo otpRepo;
  ClearAccessTokenUseCase(this.otpRepo);

  Future<void> call() async {
    return await otpRepo.clearAccessToken();
  }
}

class CacheAccessTokenUseCase {
  final OtpRepo otpRepo;
  CacheAccessTokenUseCase(this.otpRepo);

  Future<void> call(String accessToken) async {
    return await otpRepo.cacheAccessToken(accessToken);
  }
}