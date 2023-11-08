part of 'movies_cubit.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}


// States Trend
final class TrendMoviesInitial extends MoviesState {}

final class TrendMoviesLoading extends MoviesState {}

final class TrendMoviesFailure extends MoviesState {
  final String errMessage;

  const TrendMoviesFailure(this.errMessage);
}

final class TrendMoviesSuccess extends MoviesState {
  final List<MovieModel> movies;

  const TrendMoviesSuccess(this.movies);
}


// States Toprated
final class TopRatedInitial extends MoviesState {}

final class TopRatedFailure extends MoviesState {
  final String errMessage;
  const TopRatedFailure(this.errMessage);
}

final class TopRatedSuccess extends MoviesState {
  final List<MovieModel> movies;
  const TopRatedSuccess(this.movies);
}


// States Popular
final class PopularMoviesInitial extends MoviesState {}
final class PopularMoviesFailure extends MoviesState {
  final String errMessage;

  const PopularMoviesFailure(this.errMessage);
}
final class PopularMoviesSuccess extends MoviesState {
  final List<MovieModel> movies;

  const PopularMoviesSuccess(this.movies);
}