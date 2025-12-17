import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/core/error/exceptions.dart';
import '../model/city_model.dart';

abstract class CityLocalDataSource {
  Future<void> cacheCities(List<CityModel> cities);

  Future<List<CityModel>> getCachedCities();
}

const CACHED_USERS = "CACHED_USERS";

class CityLocalDataSourceImpl implements CityLocalDataSource {
  final SharedPreferences sharedPreferences;

  CityLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CityModel>> getCachedCities() async {
    final jsonString = sharedPreferences.getString(CACHED_USERS);
    if (jsonString != null) {
      return json.decode(jsonString);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<void> cacheCities(List<CityModel> cities) async {
    await sharedPreferences.setString(CACHED_USERS, json.encode(cities));
  }
}
