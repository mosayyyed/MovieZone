part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess(
    this.token,
  );
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
