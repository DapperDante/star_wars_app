import 'package:star_wars/core/api/swapi/models/film.model.dart';
import 'package:star_wars/core/api/swapi/models/planet.model.dart';
import 'package:star_wars/core/api/swapi/models/vehicle.model.dart';
import 'package:star_wars/services/film.service.dart';
import 'package:star_wars/services/planet.service.dart';
import 'package:star_wars/services/vehicle.service.dart';

class HomeViewModel {
  const HomeViewModel({required this.planetService, required this.filmService, required this.vehicleService});
  final PlanetService planetService;
  final FilmService filmService;
  final VehicleService vehicleService;
  Future<List<Planet>> fetchPlanets() => planetService.fetchPlanets();
  Future<List<Film>> fetchFilms() => filmService.fetchFilms();
  Future<List<Vehicle>> fetchVehicles() => vehicleService.fetchVehicles();
}