import 'package:dio/dio.dart';
import 'package:star_wars/core/api/databank/models/specie.model.dart';

class SpecieService {
  SpecieService({required this._api});
  final Dio _api;
  final String _baseUrl = '/species';
  Future<List<SpecieModel>> fetchSpecies() async {
    try{
      final response = await _api.get(_baseUrl);
      final List<SpecieModel> species = (response.data['data'] as List)
          .map((specie) => SpecieModel.fromJson(specie))
          .toList();
      return species;
    } catch (e) {
      return [];
    }
  }
}