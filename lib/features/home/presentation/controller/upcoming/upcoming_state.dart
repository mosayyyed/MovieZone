part of 'upcoming_cubit.dart';

sealed class UpcomingState {}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingLoading extends UpcomingState {
  final List<MovieModel> fakeUpcomingMovies;

  UpcomingLoading(this.fakeUpcomingMovies);
}

final class UpcomingSuccess extends UpcomingState {
  final List<MovieModel> upcomingMovies;

  UpcomingSuccess(this.upcomingMovies);
}

final class UpcomingError extends UpcomingState {
  final String message;

  UpcomingError(this.message);
}
