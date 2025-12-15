import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/advertisements_entity.dart';
import '../../domain/repo/advertisement_repo.dart';
import '../data_source/advertisements_remote_data_source.dart';

class AdvertisementRepoImpl implements AdvertisementRepo {
  final AdvertisementRemoteDataSource remoteDataSource;

  AdvertisementRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<AdvertisementEntity>>> getAdvertisements({int? cityId, String? status,}) async
  {
    try {
      final result = await remoteDataSource.getAdvertisements(
        cityId: cityId,
        status: status,
      );
      return Right(result);
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(NetworkFailure());
    }
  }
}
