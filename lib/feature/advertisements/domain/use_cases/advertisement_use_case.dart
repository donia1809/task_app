import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/advertisements_entity.dart';
import '../repo/advertisement_repo.dart';


class GetAdvertisementsUseCase {
  final AdvertisementRepo repo;

  GetAdvertisementsUseCase(this.repo);

  Future<Either<Failure, List<AdvertisementEntity>>> call({
    int? cityId,
    String? status,
  }) async {
    return await repo.getAdvertisements(cityId: cityId, status: status);
  }
}
