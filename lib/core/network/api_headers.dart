import 'api_constants.dart';

Map<String, String> defaultHeaders() => {
  "Api-Key": ApiConstants.apiKey,
  "Api-Version": ApiConstants.apiVersion,
  "Accept-Language": "ar",
  "Content-Type": "application/json",
};

Map<String, String> authHeaders(String token) => {
  ...defaultHeaders(),
  "Authorization": "Bearer $token",
};
