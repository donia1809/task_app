import 'dart:convert';
import 'dart:developer';
import '../../../../../core/utils/handle_response.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_headers.dart';
import '../models/login_model.dart';
import 'package:http/http.dart' as http;

abstract class LogInRemoteDataSource {
  Future<LogInModel> logInWithMobile(String mobile);
}

class LogInRemoteDataSourceImpl implements LogInRemoteDataSource {
  final http.Client client;

  LogInRemoteDataSourceImpl({required this.client});

  @override
  Future<LogInModel> logInWithMobile(String mobile) async {
    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}/client-api/v1/auth/login'),
      headers: defaultHeaders(),
      body: json.encode({"mobile": mobile}),
    );
    log(response.body.toString());
    final jsonMap = ResponseHandler.handleResponse(response);
    return LogInModel.fromJson(jsonMap);
  }
}
