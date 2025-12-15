import 'dart:convert';

import 'package:http/http.dart' as http;

import '../error/exceptions.dart';

class ResponseHandler {
  static dynamic handleResponse(http.Response response) {
    print('STATUS CODE: ${response.statusCode}');
    print('RESPONSE BODY: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnAuthorizedException();
    } else if (response.statusCode == 422) {
      throw ValidationException();
    } else if (response.statusCode >= 500) {
      throw ServerException();
    } else {
      throw Exception();
    }
  }
}
