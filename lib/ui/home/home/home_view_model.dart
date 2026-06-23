import 'package:star_wars/services/SharedPreferences.service.dart';
import 'package:star_wars/services/film.service.dart';
import 'package:star_wars/services/planet.service.dart';
import 'package:star_wars/services/vehicle.service.dart';

class HomeViewModel {
  const HomeViewModel({required this.planetService, required this.filmService, required this.vehicleService, required this.prefs});
  final PlanetService planetService;
  final FilmService filmService;
  final VehicleService vehicleService;
  final SharedPreferencesService prefs;
  Future<Map<String, List<dynamic>>> fetchAllData() async {
    final planets = await planetService.fetchPlanets();
    final films = await filmService.fetchFilms();
    final vehicles = await vehicleService.fetchVehicles();
    return {
      'planets': planets,
      'films': films,
      'vehicles': vehicles,
    };
  }
  Future<void> completeTutorial() async {
    await prefs.setTutorialCompleted(true);
  }
  Future<bool> isTutorialCompleted() async {
    return await prefs.isTutorialCompleted();
  }
}