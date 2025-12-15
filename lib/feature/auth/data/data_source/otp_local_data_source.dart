import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';

abstract class OtpLocalDataSource
{
  Future<Map<String, String>> getCachedOtp();
  Future<void>cacheOtp(String otp,String accessToken);
  Future<void>clearOtp();
}
const CACHED_OTP = "CACHED_OTP";

class OtpLocalDataSourceImpl implements OtpLocalDataSource
{
  final SharedPreferences sharedPreferences;

  OtpLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Map<String, String>> getCachedOtp() async {
    final jsonString = sharedPreferences.getString(CACHED_OTP);
    if(jsonString != null) {
      final data = json.decode(jsonString) as Map<String, dynamic>;
      return {
        "otp": data["otp"],
        "accessToken": data["accessToken"],
      };
    }
    else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<void> cacheOtp(String otp, String accessToken)async {
    final data = json.encode({
      "otp": otp,
      "accessToken": accessToken,
    });
    await sharedPreferences.setString(CACHED_OTP, data);
  }

  @override
  Future<void> clearOtp() async{
    await sharedPreferences.remove(CACHED_OTP);

  }
}
