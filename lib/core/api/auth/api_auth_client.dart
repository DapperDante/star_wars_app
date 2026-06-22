import 'package:dio/dio.dart';
import 'package:star_wars/core/config.dart';
import 'package:star_wars/services/SharedPreferences.service.dart';

class ApiAuthClient {
  late final Dio _dio;
  ApiAuthClient({required SharedPreferencesService prefs}){
    _dio = Dio(BaseOptions(baseUrl: apiAuthUrl));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await prefs.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          await prefs.removeToken();
        }
        return handler.next(error);
      },
    ));
  }
  Dio get client => _dio;
}