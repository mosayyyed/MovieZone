import 'package:dio/dio.dart';

import 'failures.dart';

class ApiFailure extends Failure {
  const ApiFailure(super.message);

  factory ApiFailure.fromException(dynamic e) {
    String errorMessage = _getErrorMessage(e);
    return ApiFailure(errorMessage);
  }

  static String _getErrorMessage(dynamic e) {
    if (e is DioException) {

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return 'انتهت مهلة الاتصال بالخادم.';
        case DioExceptionType.sendTimeout:
          return 'الخادم لم يستجب في الوقت المحدد.';
        case DioExceptionType.receiveTimeout:
          return 'الخادم يستغرق وقتًا طويلاً للرد.';
        case DioExceptionType.badCertificate:
          return 'شهادة غير صالحة، لا يمكن الوصول إلى المورد.';
        case DioExceptionType.connectionError:
          return 'حدث خطأ في الاتصال.';
        case DioExceptionType.badResponse:
          return 'الخادم أرجع استجابة غير صحيحة.';
        case DioExceptionType.cancel:
          return 'تم إلغاء الطلب.';
        case DioExceptionType.unknown:
          return 'خطأ غير معروف.';
      }
    }

    if (e is Exception) {
      return 'حدث استثناء غير متوقع: ${e.toString()}';
    }

    return 'حدث خطأ غير معروف.';
  }
}
