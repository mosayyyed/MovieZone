import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String token;
  final String fullName;
  final String email;
  final String phone;
  final bool isVerified;

  const UserModel({
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

  factory UserModel.fake() {
    return UserModel(
      token: '456078ni5hg6hib',
      fullName: 'john doe',
      email: 'john@gmail.com',
      phone: '+201010101010',
    );
  }
  @override
  List<Object?> get props => [
        token,
        fullName,
        email,
        phone,
        isVerified,
      ];
}
