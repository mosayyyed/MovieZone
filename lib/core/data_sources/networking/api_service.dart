import 'package:dio/dio.dart';

import 'dio_factory.dart';

class ApiService {
  late final Dio _dio;

  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal() {
    _dio = DioFactory.createDio();
  }

  Future<Response> get({
    required String endpoint,
    required Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(endpoint, queryParameters: queryParameters);
  }

  Future<Response> post({
    required String endpoint,
    required Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) {
    return _dio.post(endpoint,
        queryParameters: queryParameters, options: options, data: data);
  }

  Future<Response> put({
    required String endpoint,
    required Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) {
    return _dio.put(endpoint,
        queryParameters: queryParameters, options: options, data: data);
  }

  Future<Response> delete({
    required String endpoint,
    required Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.delete(endpoint,
        queryParameters: queryParameters, options: options);
  }
}