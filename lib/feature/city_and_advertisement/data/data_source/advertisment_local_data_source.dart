import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../model/advertisements_model.dart';

abstract class AdvertisementLocalDataSource {
  Future<void> cacheAdvertisements(List<AdvertisementModel> ads);
  Future<List<AdvertisementModel>> getCachedAdvertisements();
}

const CACHED_ADVERTISEMENTS = 'CACHED_ADVERTISEMENTS';

class AdvertisementLocalDataSourceImpl implements AdvertisementLocalDataSource {
  final SharedPreferences sharedPreferences;

  AdvertisementLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheAdvertisements(List<AdvertisementModel> ads) async {
    final jsonList = ads.map((e) => e.toJson()).toList();
    await sharedPreferences.setString(
      CACHED_ADVERTISEMENTS,
      json.encode(jsonList),
    );
  }

  @override
  Future<List<AdvertisementModel>> getCachedAdvertisements() async {
    final jsonString =
        sharedPreferences.getString(CACHED_ADVERTISEMENTS);

    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      return decoded
          .map((e) => AdvertisementModel.fromJson(e))
          .toList();
    } else {
      throw EmptyCacheException();
    }
  }
}
