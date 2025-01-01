import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get({
    required String endpoint,
    required Map<String, dynamic> queryParameters,
    Options? options,
  }) async {
    final response = await _dio.get(
      "$kBaseUrl/$endpoint",
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }

  Future<Response> post({
    required String endpoint,
    required Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    final response = await _dio.post(
      "$kBaseUrl/$endpoint",
      queryParameters: queryParameters,
      options: options,
      data: data,
    );
    return response;
  }

  Future<Response> put({
    required String endpoint,
    required Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    final response = await _dio.put(
      "$kBaseUrl/$endpoint",
      queryParameters: queryParameters,
      options: options,
      data: data,
    );
    return response;
  }

  Future<Response> delete({
    required String endpoint,
    required Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.delete(
      "$kBaseUrl/$endpoint",
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }
}
