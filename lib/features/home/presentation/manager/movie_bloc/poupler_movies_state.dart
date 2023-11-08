part of 'poupler_movies_cubit.dart';

sealed class PouplerMoviesState extends Equatable {
  const PouplerMoviesState();

  @override
  List<Object> get props => [];
}

final class PouplerMoviesInitial extends PouplerMoviesState {}
final class PopularMoviesInitial extends PouplerMoviesState {}
final class PopularMoviesFailure extends PouplerMoviesState {
  final String errMessage;

  const PopularMoviesFailure(this.errMessage);
}
final class PopularMoviesSuccess extends PouplerMoviesState {
  final List<MovieModel> movies;

  const PopularMoviesSuccess(this.movies);
}