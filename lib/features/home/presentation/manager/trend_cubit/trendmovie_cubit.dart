import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/movie_model.dart';
import '../../../data/repository/home_repo.dart';
part 'trendmovie_state.dart';

class TrendMoviesCubit extends Cubit<TrendMoviesState> {
  TrendMoviesCubit(this.homeRepo) : super(TrendMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchTrendMovies() async {
    var result = await homeRepo.fetchTrendMovies();
    result.fold((failure) {
      emit(TrendMoviesFailure(failure.errMessage));
    }, (movies) {
      emit(TrendMoviesSuccess(movies));
    });
  }
}