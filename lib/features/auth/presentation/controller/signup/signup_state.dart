part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {}

final class SignupInitial extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupLoading extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupSuccess extends SignupState {
  final String token;

  SignupSuccess(this.token);

  @override
  List<Object?> get props => [token];
}

class SignupError extends SignupState {
  final String message;

  SignupError(this.message);

  @override
  List<Object?> get props => [message];
}
