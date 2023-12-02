part of 'search_cubit.dart';

sealed class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

final class SearchMoviesInitial extends SearchMoviesState {}

final class SearchMoviesFailure extends SearchMoviesState {
  final String errMessage;

  const SearchMoviesFailure(this.errMessage);
}

final class SearchMoviesLoading extends SearchMoviesState {}

final class SearchMoviesSuccess extends SearchMoviesState {
  final List<MovieModel> movies;

  const SearchMoviesSuccess(this.movies);
}