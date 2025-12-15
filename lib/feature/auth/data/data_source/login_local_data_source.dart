import 'dart:convert';

import 'package:task_app/feature/auth/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class LogInLocalDataSource
{
  Future<LogInModel> getCachedUser();
  Future<void>cacheUser(LogInModel user);
  Future<void>clearUser();
}
const CACHED_USERS = "CACHED_USERS";

class LogInLocalDataSourceImpl implements LogInLocalDataSource
{
  final SharedPreferences sharedPreferences;

  LogInLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LogInModel> getCachedUser() async {
    final jsonString = sharedPreferences.getString(CACHED_USERS);
    if(jsonString != null){
      return LogInModel.fromJson(json.decode(jsonString));
  }
  else {
  throw EmptyCacheException();
  }
}

  @override
  Future<void> cacheUser(LogInModel user)async {
    await sharedPreferences.setString(CACHED_USERS, json.encode(user.toJson()));
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferences.remove(CACHED_USERS);
  }

}