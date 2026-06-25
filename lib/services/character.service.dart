import 'package:dio/dio.dart';
import 'package:star_wars/core/api/databank/models/character.model.dart';

class CharacterService {
  CharacterService({required this._api});
  late final Dio _api;
  final String _baseUrl = '/characters';
  Future<List<CharacterModel>> fetchCharacters() async {
    try{
      final response = await _api.get(_baseUrl);
      final List<CharacterModel> characters = (response.data['data'] as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList();
      return characters;
    } catch (e) {
      return [];
    }
  }
}