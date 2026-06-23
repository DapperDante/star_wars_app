import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final String _token = 'token';
  final String _isFirstTime = 'isFirstTime';
  final String _isTutorialCompleted = 'isTutorialCompleted';
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }
  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
  }
  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstTime) ?? true;
  }
  Future<void> setIsFirstTime(bool isFirstTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstTime, isFirstTime);
  }
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
  }
  Future<bool> isTutorialCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isTutorialCompleted) ?? false;
  }
  Future<void> setTutorialCompleted(bool isCompleted) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isTutorialCompleted, isCompleted);
  }
}