import 'package:dio/dio.dart';
import 'package:star_wars/core/api/databank/models/droid.model.dart';

class DroidService {
  DroidService({required this._api});
  final Dio _api;
  final String _baseUrl = '/droids';
  Future<List<DroidModel>> fetchDroids() async {
    try{
      final response = await _api.get(_baseUrl);
      final List<DroidModel> droids = (response.data['data'] as List)
          .map((droid) => DroidModel.fromJson(droid))
          .toList();
      return droids;
    } catch (e) {
      return [];
    }
  }
}