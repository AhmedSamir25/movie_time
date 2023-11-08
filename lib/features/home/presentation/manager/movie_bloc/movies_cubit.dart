import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/movie_model.dart';
import '../../../data/repository/home_repo.dart';
part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.homeRepo) : super(TrendMoviesInitial());
  final HomeRepo homeRepo;
  //Trend
  Future<void> fetchTrendMovies() async {
    var result = await homeRepo.fetchTrendMovies();
    result.fold((failure) {
      emit(TrendMoviesFailure(failure.errMessage));
    }, (movies) {
      emit(TrendMoviesSuccess(movies));
    });
  }

  //Toprated
  Future<void> fetchTopRated() async {
    var result = await homeRepo.fetchTopRated();
    result.fold((failure) {
      emit(TopRatedFailure(failure.errMessage));
    }, (movies) {
      emit(TopRatedSuccess(movies));
    });
  }

  // Popular
  Future<void> fetchPopularMovies() async {
    var result = await homeRepo.fetchPopularMovies();
    result.fold((failure) {
      emit(PopularMoviesFailure(failure.errMessage));
    }, (movies) {
      emit(PopularMoviesSuccess(movies));
    });
  }
}
