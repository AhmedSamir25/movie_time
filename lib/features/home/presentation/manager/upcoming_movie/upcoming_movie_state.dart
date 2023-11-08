part of 'upcoming_movie_cubit.dart';

sealed class UpcomingMovieState extends Equatable {
  const UpcomingMovieState();

  @override
  List<Object> get props => [];
}

final class UpcomingMovieInitial extends UpcomingMovieState {}
sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];

}
  final class UpcomingMovieFailure extends UpcomingMovieState {
  final String errMessage;

  const UpcomingMovieFailure(this.errMessage);
}
final class UpcomingMovieSuccess extends UpcomingMovieState {
  final List<MovieModel> movies;

  const UpcomingMovieSuccess(this.movies);
}



