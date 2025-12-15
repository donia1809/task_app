import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/advertisements_entity.dart';

abstract class AdvertisementRepo {
  Future<Either<Failure, List<AdvertisementEntity>>> getAdvertisements({
    int? cityId,
    String? status,
  });
}

