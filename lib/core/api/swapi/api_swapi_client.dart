import 'package:dio/dio.dart';
import 'package:star_wars/core/config.dart';

class ApiSwapiClient {
  late final Dio _dio;
  ApiSwapiClient(){
    _dio = Dio(BaseOptions(baseUrl: apiUrl));
  }
  Dio get client => _dio;
}