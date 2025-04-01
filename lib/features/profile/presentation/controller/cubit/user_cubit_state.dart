import 'package:equatable/equatable.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;
  const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}
