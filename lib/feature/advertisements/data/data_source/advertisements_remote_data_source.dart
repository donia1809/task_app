import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../models/advertisements_model.dart';

abstract class AdvertisementRemoteDataSource {
  Future<List<AdvertisementModel>> getAdvertisements({
    int? cityId,
    String? status,
  });
}

class AdvertisementRemoteDataSourceImpl implements AdvertisementRemoteDataSource {
  final http.Client client;

  AdvertisementRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AdvertisementModel>> getAdvertisements({
    int? cityId,
    String? status,
  }) async {
    final uri = Uri.parse(
      'https://backend.seed.moltaqadev.com/client-api/v1/advertisements',
    ).replace(
      queryParameters: {
        if (cityId != null) 'city_id': cityId.toString(),
        if (status != null) 'status': status,
      },
    );

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List list = decoded['data'];
      return list.map((e) => AdvertisementModel.fromJson(e)).toList();
    } else if (response.statusCode == 401) {
      throw UnAuthorizedException();
    } else {
      throw ServerException();
    }
  }
}
