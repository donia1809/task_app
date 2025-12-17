import 'package:http/http.dart' as http;
import 'package:task_app/core/network/api_constants.dart';
import 'package:task_app/core/network/api_headers.dart';
import 'package:task_app/core/utils/handle_response.dart';
import '../model/city_model.dart';

abstract class CityRemoteDataSource {
  Future<List<CityModel>> getCities();
}

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  final http.Client client;

  CityRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CityModel>> getCities() async {
    final response = await client.get(
      Uri.parse('${ApiConstants.baseUrl}/client-api/v1/cities?page=0&limit=0'),
      headers: defaultHeaders(),
    );

    final jsonMap = ResponseHandler.handleResponse(response);

    final List citiesList = jsonMap['data']; 

    return citiesList
        .map((e) => CityModel.fromJson(e))
        .toList();
  }
}

