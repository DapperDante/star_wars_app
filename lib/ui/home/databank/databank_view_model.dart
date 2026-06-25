import 'package:star_wars/core/models/object.model.dart';
import 'package:star_wars/services/character.service.dart';
import 'package:star_wars/services/droid.service.dart';
import 'package:star_wars/services/specie.service.dart';

class DatabankViewModel {
  const DatabankViewModel({required this._characterService, required this._droidService, required this._specieService});
  final CharacterService _characterService;
  final DroidService _droidService;
  final SpecieService _specieService;
  Future<Map<String, List<ObjectModel>>> fetchAllData() async {
    final characters = await _characterService.fetchCharacters();
    final droids = await _droidService.fetchDroids();
    final species = await _specieService.fetchSpecies();
    return {
      'characters': characters,
      'droids': droids,
      'species': species,
    };
  }
}