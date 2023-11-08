import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/movie_model.dart';
import '../../../data/repository/home_repo.dart';
part 'poupler_movies_state.dart';

class PouplerMoviesCubit extends Cubit<PouplerMoviesState> {
  PouplerMoviesCubit(this.homeRepo) : super(PouplerMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchPopularMovies() async {
    var result = await homeRepo.fetchPopularMovies();
    result.fold((failure) {
      emit(PopularMoviesFailure(failure.errMessage));
    }, (movies) {
      emit(PopularMoviesSuccess(movies));
    });
  }
}
