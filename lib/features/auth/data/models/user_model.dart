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
      token: map['token'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      isVerified: map['isVerified'] ?? false,
    );
  }
}
