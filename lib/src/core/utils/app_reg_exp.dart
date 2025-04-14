class AppRegExp {
  static bool isEmailValid(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password);
  }

  static bool isNameValid(String fullName) {
    return RegExp(r'^[\p{L}\s]{2,}$', unicode: true).hasMatch(fullName);
  }

  static bool isPhoneValid(String phone) {
    return RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phone);
  }
}
