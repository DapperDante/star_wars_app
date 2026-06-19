import 'package:dio/dio.dart';
import 'package:star_wars/core/api/swapi/models/vehicle.model.dart';

class VehicleService {
  VehicleService({required this._api});
  late final Dio _api;
  final String _baseUrl = '/vehicles';
  Future<List<Vehicle>> fetchVehicles() async {
    try{
      final response = await _api.get(_baseUrl);
      final List<Vehicle> vehicles = (response.data as List)
          .map((vehicle) => Vehicle.fromJson(vehicle))
          .toList();
      return vehicles;
    } catch (e) {
      return [];
    }
  }
  Future<Vehicle?> fetchVehicle(int id) async {
    try{
      final response = await _api.get('$_baseUrl/$id');
      return Vehicle.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}