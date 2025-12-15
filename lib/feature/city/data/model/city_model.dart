import '../../domain/entity/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({
    required int id,
    required String name,
  }) : super(
    id: id,
    name: name,
  );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name
    };
  }
  }
