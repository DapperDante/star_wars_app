import 'package:dio/dio.dart';
import 'package:star_wars/core/api/swapi/models/planet.model.dart';

class PlanetService {
  PlanetService({required this._api});
  late final Dio _api;
  final String _baseUrl = '/planets';
  Future<List<Planet>> fetchPlanets() async {
    try{
      final response = await _api.get(_baseUrl);
      final List<Planet> planets = (response.data as List)
          .map((planet) => Planet.fromJson(planet))
          .toList();
      return planets;
    } catch (e) {
      rethrow;
    }
  }
  Future<Planet> fetchPlanet(String id) async {
    try{
      final response = await _api.get('$_baseUrl/$id');
      return Planet.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}