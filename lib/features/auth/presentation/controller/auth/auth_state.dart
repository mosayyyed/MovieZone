part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {
  final bool? isAgreed;
  final bool? isVisible;

  AuthInitial({this.isAgreed, this.isVisible});
}

final class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class PasswordVisibilityChanged extends AuthState {
  final bool isVisible;

  PasswordVisibilityChanged(this.isVisible);
}
