import 'package:dartz/dartz.dart';
import 'package:task_app/core/error/failure.dart';
import 'package:task_app/core/network/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entity/advertisements_entity.dart';
import '../../domain/repo/advertisement_repo.dart';
import '../data_source/advertisements_remote_data_source.dart';
import '../data_source/advertisment_local_data_source.dart';
import '../model/advertisements_model.dart';

class AdvertisementRepoImpl implements AdvertisementRepo {
  final AdvertisementRemoteDataSource advertisementRemoteDataSource;
  final AdvertisementLocalDataSource advertisementLocalDataSource;
  final NetworkInfo networkInfo;

  AdvertisementRepoImpl({
    required this.advertisementRemoteDataSource,
    required this.advertisementLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<AdvertisementEntity>>> getAdvertisements({
    required int cityId,
    required String status,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        List<AdvertisementModel> ads;

        if (cityId == 0) {
          ads = await advertisementRemoteDataSource.getAdvertisements(status: status, cityId: cityId);
        } else {
          ads = await advertisementRemoteDataSource.getAdvertisements(
            cityId: cityId,
            status: status,
          );
        }

        if (ads.isEmpty) {
          return Left(AdvertisementFailure());
        }

        await advertisementLocalDataSource.cacheAdvertisements(ads);
        return Right(ads);
      } on UnAuthorizedException {
        return Left(UnAuthorizedFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on NetworkException {
        return Left(NetworkFailure());
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachedAds = await advertisementLocalDataSource.getCachedAdvertisements();

        if (cachedAds.isEmpty) {
          return Left(AdvertisementFailure());
        }

        return Right(cachedAds);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      } catch (_) {
        return Left(ServerFailure());
      }
    }
  }

}
