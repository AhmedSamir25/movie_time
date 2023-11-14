part of 'toprated_cubit.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedFailure extends TopRatedState {
  final String errMessage;

  const TopRatedFailure(this.errMessage);
}

final class TopRatedFailurePage extends TopRatedState {
  final String errMessage;

  const TopRatedFailurePage(this.errMessage);
}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedLoadingpage extends TopRatedState {}

final class TopRatedSuccess extends TopRatedState {
  final List<MovieModel> movies;

  const TopRatedSuccess(this.movies);
}