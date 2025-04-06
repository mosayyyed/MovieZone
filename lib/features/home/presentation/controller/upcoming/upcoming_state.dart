part of 'upcoming_cubit.dart';

sealed class UpcomingState extends Equatable {}

final class UpcomingInitial extends UpcomingState {
  @override
  List<Object?> get props => [];
}

final class UpcomingLoading extends UpcomingState {
  final List<MovieModel> fakeUpcomingMovies;

  UpcomingLoading(this.fakeUpcomingMovies);

  @override
  List<Object?> get props => [fakeUpcomingMovies];
}

final class UpcomingSuccess extends UpcomingState {
  final List<MovieModel> upcomingMovies;

  UpcomingSuccess(this.upcomingMovies);

  @override
  List<Object?> get props => [upcomingMovies];
}

final class UpcomingError extends UpcomingState {
  final String message;

  UpcomingError(this.message);

  @override
  List<Object?> get props => [message];
}
