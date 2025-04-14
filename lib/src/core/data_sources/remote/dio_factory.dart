import 'package:dio/dio.dart';
// import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../../utils/app_constants.dart';

class DioFactory {
  DioFactory._internal();

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.api.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // final cacheOptions = CacheOptions(
    //   store: MemCacheStore(),
    //   policy: CachePolicy.forceCache,
    //   maxStale: const Duration(days: 7),
    // );

    // dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.uri}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode} ${response.data}');
          handler.next(response);
        },
        onError: (DioException e, handler) {
          print('Error: ${e.response?.statusCode} ${e.message}');
          handler.next(e);
        },
      ),
    );

    return dio;
  }

  // static Options getCacheOptions(
  //     {Duration duration = const Duration(hours: 1)}) {
  //   return CacheOptions(
  //     store: MemCacheStore(),
  //     policy: CachePolicy.forceCache,
  //     maxStale: duration,
  //   ).toOptions();
  // }
}
