class AppRegExp {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&]).{9,}$")
        .hasMatch(password);
  }

  static bool isNicknameValid(String nickname) {
    return RegExp(r'^[a-zA-Z0-9#]+$').hasMatch(nickname);
  }

  static bool isPhoneValid(String phone) {
    return RegExp(r'^\+?\d{10,15}$').hasMatch(phone);
  }
}
