import 'package:dio/dio.dart';

abstract class ApiService {
  
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  });

  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  });

  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
