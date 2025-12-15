import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/city_entity.dart';

abstract class CityRepo {
  Future<Either<Failure, List<CityEntity>>> getCities();
}
