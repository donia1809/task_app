import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as client;

import '../../../../../core/utils/handle_response.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_headers.dart';
import '../models/otp_model.dart';
import 'package:http/http.dart' as http;

abstract class OtpRemoteDataSource {
  Future<OtpModel> verifyOtp(String otp, String accessToken);
}

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final http.Client client;

  OtpRemoteDataSourceImpl({required this.client});

  @override
  Future<OtpModel> verifyOtp(String otp, String token) async {
    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}/verify-otp'),
      headers: authHeaders(token),
      body: json.encode({"code": otp}),
    );
    log(response.statusCode.toString());

    final jsonMap = ResponseHandler.handleResponse(response);
    return OtpModel.fromJson(jsonMap);
  }
}
