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
      switch (e.response!.statusCode) {
        case 404:
          return 'المورد المطلوب غير موجود.';
        case 500:
          return 'خطأ في الخادم. يرجى المحاولة لاحقًا.';
        case 401:
          return 'غير مصرح. تحقق من بيانات الاعتماد.';
        case 403:
          return 'ليس لديك الصلاحية للوصول إلى هذا المورد.';
        case 408:
          return 'انتهت مهلة الطلب. يرجى المحاولة لاحقًا.';
        default:
          return 'حدث خطأ غير معروف. كود الخطأ: ${e.response!.statusCode}';
      }
    } else if (e is Exception) {
      return 'حدث استثناء غير متوقع: ${e.toString()}';
    } else {
      return 'حدث خطأ غير معروف.';
    }
  }
}
