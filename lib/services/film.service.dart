import 'package:dio/dio.dart';
import 'package:star_wars/core/api/swapi/models/film.model.dart';

class FilmService {
  FilmService({required this._api});
  late final Dio _api;
  final String _baseUrl = '/films';
  Future<List<Film>> fetchFilms() async {
    try{
      final response = await _api.get(_baseUrl);
      final List<Film> films = (response.data as List)
          .map((film) => Film.fromJson(film))
          .toList();
      return films;
    } catch (e) {
      return [];
    }
  }
  Future<Film?> fetchFilm(int id) async {
    try{
      final response = await _api.get('$_baseUrl/$id');
      return Film.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}