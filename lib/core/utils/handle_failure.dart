import 'package:dartz/dartz.dart';

import '../error/exceptions.dart';
import '../error/failure.dart';

Either<Failure, T> handleException<T>(Exception e) {
  if (e is OfflineException) return Left(OfflineFailure());
  if (e is NetworkException) return Left(NetworkFailure());
  if (e is ServerException) return Left(ServerFailure());
  if (e is UnAuthorizedException) return Left(UnAuthorizedFailure());
  if (e is EmptyCacheException) return Left(EmptyCacheFailure());
  if (e is ValidationException) return Left(ValidationFailure());
  if (e is AdvertisementException) return Left(AdvertisementFailure());
  return Left(UnexpectedFailure());
}
