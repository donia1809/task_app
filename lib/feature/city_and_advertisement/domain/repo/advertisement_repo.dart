import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/advertisements_entity.dart';

abstract class AdvertisementRepo {
  Future<Either<Failure, List<AdvertisementEntity>>> getAdvertisements({
    required int cityId,
    required String status,
  });
}

