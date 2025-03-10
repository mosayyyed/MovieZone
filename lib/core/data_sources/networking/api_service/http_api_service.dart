import 'package:dio/dio.dart';

import '../dio_factory.dart';
import 'api_service.dart';

class HttpApiService implements ApiService {
  late final Dio _dio;

  HttpApiService() {
    _dio = DioFactory.createDio();
  }

  @override
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(endpoint, queryParameters: queryParameters);
  }

  @override
  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) {
    return _dio.post(endpoint,
        queryParameters: queryParameters, options: options, data: data);
  }

  @override
  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) {
    return _dio.put(endpoint,
        queryParameters: queryParameters, options: options, data: data);
  }

  @override
  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.delete(endpoint,
        queryParameters: queryParameters, options: options);
  }
}
