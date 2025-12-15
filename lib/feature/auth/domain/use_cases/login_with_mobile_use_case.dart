import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/login_entity.dart';
import '../repo/login_repo.dart';

class LogInWithMobileUseCase{
  final LogInRepo loginRepo;

  LogInWithMobileUseCase(this.loginRepo);

  Future<Either<Failure, LogInEntity>> call(String mobile) async
  {
    return await loginRepo.logInWithMobile(mobile);
  }
}

class GetCachedUserUseCase {
  final LogInRepo loginRepo;

  GetCachedUserUseCase(this.loginRepo);

  Future<Either<Failure, LogInEntity>> call() async {
    return await loginRepo.getCachedUser();
  }
}
