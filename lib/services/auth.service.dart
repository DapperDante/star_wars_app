import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/services/SharedPreferences.service.dart';

class AuthService extends ChangeNotifier {
  AuthService({required this._api, required this._prefs});
  final SharedPreferencesService _prefs;
  final Dio _api;
  final String _baseUrl = 's31vw4Ce/auth';
  Future<bool> login(String email, String password) async {
    try {
      final response = await _api.post(
        '$_baseUrl/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        await _prefs.setToken(response.data['authToken']);
        notifyListeners();
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> isAuthenticated() async {
    final token = await _prefs.getToken();
    return token != null;
  }
  Future<bool> isFirstTime() async {
    final isFirstTime = await _prefs.isFirstTime();
    return isFirstTime;
  }
  Future<void> setFirstTime(bool value) async {
    await _prefs.setIsFirstTime(value);
    notifyListeners();
  }
}
