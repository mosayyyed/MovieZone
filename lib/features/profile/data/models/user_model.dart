class UserModel {
  final String token;
  final String fullName;
  final String email;
  final String phone;
  final bool isVerified;

  UserModel({
    required this.token,
    required this.fullName,
    required this.email,
    required this.phone,
    this.isVerified = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      token: map['token'],
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
      isVerified: map['isVerified'] ?? false,
    );
  }
}
