part of 'signup_cubit.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final String token;
  final String fullName;

  SignupSuccess(this.token, this.fullName);
}

class SignupError extends SignupState {
  final String message;

  SignupError(this.message);
}
