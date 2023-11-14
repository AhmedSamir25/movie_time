part of 'upcoming_movie_cubit.dart';

sealed class UpcomingMovieState extends Equatable {
  const UpcomingMovieState();

  @override
  List<Object> get props => [];
}

final class UpcomingMovieInitial extends UpcomingMovieState {}

final class UpcomingMovieFailure extends UpcomingMovieState {
  final String errMessage;

  const UpcomingMovieFailure(this.errMessage);
}

final class UpcomingMovieFailurePage extends UpcomingMovieState {
  final String errMessage;

  const UpcomingMovieFailurePage(this.errMessage);
}

final class UpcomingMovieLoading extends UpcomingMovieState {}

final class UpcomingMovieLoadingpage extends UpcomingMovieState {}

final class UpcomingMovieSuccess extends UpcomingMovieState {
  final List<MovieModel> movies;

  const UpcomingMovieSuccess(this.movies);
}