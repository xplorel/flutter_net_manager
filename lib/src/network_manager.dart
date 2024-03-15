import 'package:dio/dio.dart';

class NetworkManager {
  static late final NetworkManager _instance = NetworkManager._internal();
  late Dio _dio;
  factory NetworkManager() {
    return _instance;
  }
  NetworkManager._internal() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://api.example.com';
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  Future<Response> get(String path, {Map<String, dynamic>? params}) {
    return _dio.get(path, queryParameters: params);
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) {
    return _dio.post(path, data: data);
  }
}
