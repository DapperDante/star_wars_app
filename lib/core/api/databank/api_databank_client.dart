import 'package:dio/dio.dart';
import 'package:star_wars/core/config.dart';

class ApiDatabankClient {
  late final Dio _dio;
  ApiDatabankClient(){
    _dio = Dio(BaseOptions(baseUrl: apiDatabankUrl));
  }
  Dio get client => _dio;
}