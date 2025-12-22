import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';

abstract class OtpLocalDataSource {
  Future<String> getCachedAccessToken();
  Future<void> cacheAccessToken(String accessToken);
  Future<void> clearAccessToken();
}

const CACHED_ACCESS_TOKEN = "CACHED_ACCESS_TOKEN";

class OtpLocalDataSourceImpl implements OtpLocalDataSource {
  final SharedPreferences sharedPreferences;

  OtpLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getCachedAccessToken() async {
    final token = sharedPreferences.getString(CACHED_ACCESS_TOKEN);
    if (token != null) {
      return token;
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<void> cacheAccessToken(String accessToken) async {
    await sharedPreferences.setString(CACHED_ACCESS_TOKEN, accessToken);
  }

  @override
  Future<void> clearAccessToken() async {
    await sharedPreferences.remove(CACHED_ACCESS_TOKEN);
  }
}
