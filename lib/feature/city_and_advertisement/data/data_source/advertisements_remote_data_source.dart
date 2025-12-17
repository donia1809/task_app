import 'package:http/http.dart' as http;
import 'package:task_app/core/network/api_constants.dart';
import 'package:task_app/core/network/api_headers.dart';
import 'package:task_app/core/utils/handle_response.dart';
import '../model/advertisements_model.dart';

abstract class AdvertisementRemoteDataSource {
  Future<List<AdvertisementModel>> getAdvertisements({
     int? cityId,
    required String status,
  });
}

class AdvertisementRemoteDataSourceImpl implements AdvertisementRemoteDataSource {
  final http.Client client;

  AdvertisementRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AdvertisementModel>> getAdvertisements({
     int ?cityId,
    required String status,
  }) async {
    final queryParameters = {
      'status': status,
     'city_id': cityId.toString(),
    };

    final uri = Uri.parse('${ApiConstants.baseUrl}/client-api/v1/advertisements')
        .replace(queryParameters: queryParameters);

    final response = await client.get(uri, headers: defaultHeaders());


    final jsonMap = ResponseHandler.handleResponse(response);

    final List adsList = jsonMap['data']; 

    return adsList
        .map((e) => AdvertisementModel.fromJson(e))
        .toList();
  }
}
