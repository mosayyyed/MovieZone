import 'package:dio/dio.dart';

import 'api_service.dart';

class MockApiService implements ApiService {
  @override
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    return Response(
      requestOptions: RequestOptions(path: endpoint),
      data: {'message': 'Mock GET Response'},
      statusCode: 200,
    );
  }

  @override
  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    return Response(
      requestOptions: RequestOptions(path: endpoint),
      data: {'message': 'Mock POST Response'},
      statusCode: 200,
    );
  }

  @override
  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    return Response(
      requestOptions: RequestOptions(path: endpoint),
      data: {'message': 'Mock PUT Response'},
      statusCode: 200,
    );
  }

  @override
  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return Response(
      requestOptions: RequestOptions(path: endpoint),
      data: {'message': 'Mock DELETE Response'},
      statusCode: 200,
    );
  }
}
