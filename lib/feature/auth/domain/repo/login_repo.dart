import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/login_entity.dart';
abstract class LogInRepo
{
  //use case functions
  Future<Either<Failure, LogInEntity>> logInWithMobile(String mobile);
}
