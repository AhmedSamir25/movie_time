import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/movie_model.dart';
import '../../../data/repository/home_repo.dart';
part 'poupler_movies_state.dart';



class PouplerMoviesCubit extends Cubit<PouplerMoviesState> {
  PouplerMoviesCubit(this.homeRepo) : super(PouplerMoviesInitial());
  final HomeRepo homeRepo;
  Future<void> fetchPopularMovies({int numpage = 1}) async {
    if (numpage == 1) {
      emit(PouplerMoviesLoading());
    } else {
      emit(PouplerMoviesLoadingpage());
    }
    var result = await homeRepo.fetchPopularMovies(numpage: numpage);
    result.fold((failure) {
      if (numpage == 1) {
        emit(PouplerMoviesFailure(failure.errMessage));
      } else {
        emit(PouplerMoviesFailurePage(failure.errMessage));
      }
    }, (movies) {
      emit(PouplerMoviesSuccess(movies));
    });
  }
}