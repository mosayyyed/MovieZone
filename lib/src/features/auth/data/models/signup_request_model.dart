import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String phone;

  const RegisterRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        password,
        phone,
      ];
}
