part of 'trendmovie_cubit.dart';

sealed class TrendMoviesState extends Equatable {
  const TrendMoviesState();

  @override
  List<Object> get props => [];
}

final class TrendMoviesInitial extends TrendMoviesState {}
final class TrendMoviesLoading extends TrendMoviesState {}
final class TrendMoviesFailure extends TrendMoviesState {
  final String errMessage;

  const TrendMoviesFailure(this.errMessage);
}
final class TrendMoviesSuccess extends TrendMoviesState {
  final List<MovieModel> movies;

  const TrendMoviesSuccess(this.movies);
}

