import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/src/core/utils/app_reg_exp.dart';

class FormValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.emailRequiredError;
    }
    if (!AppRegExp.isEmailValid(value)) {
      return S.current.emailInvalidError;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.passwordRequiredError;
    }
    if (!AppRegExp.isPasswordValid(value)) {
      return S.current.passwordInvalidError;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return S.current.confirmPasswordRequiredError;
    }
    if (value != password) {
      return S.current.passwordsDoNotMatchError;
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.fullNameRequiredError;
    }
    if (value.length < 3) return S.current.fullNameTooShortError;
    if (!AppRegExp.isNameValid(value)) {
      return S.current.fullNameInvalidError;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.phoneNumberRequiredError;
    }
    if (!AppRegExp.isPhoneValid(value)) {
      return S.current.phoneNumberInvalidError;
    }
    return null;
  }
}
