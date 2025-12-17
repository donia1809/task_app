import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/city_entity.dart';
import '../repo/city_repo.dart';


class GetCitiesUseCase {
  final CityRepo cityRepository;

  GetCitiesUseCase(this.cityRepository);

  Future<Either<Failure, List<CityEntity>>> call() {
    return cityRepository.getCities();
  }
}
