part of 'cast_cubit.dart';

sealed class CastMovieState extends Equatable {
  const CastMovieState();

  @override
  List<Object> get props => [];
}

final class CastMovieInitial extends CastMovieState {}
final class CastMovieFailure extends CastMovieState{
  final String errMessage;

  const CastMovieFailure(this.errMessage);
}
final class CastMovieSuccess extends CastMovieState{
  final List<CastModel> cast;
  const CastMovieSuccess(this.cast);
}
