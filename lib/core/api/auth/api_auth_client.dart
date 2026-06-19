import 'package:dio/dio.dart';
import 'package:star_wars/core/config.dart';

class ApiAuthClient {
  late final Dio _dio;
  ApiAuthClient(){
    _dio = Dio(BaseOptions(baseUrl: apiAuthUrl));
  }
  Dio get client => _dio;
}