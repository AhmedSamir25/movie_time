import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home/data/repository/home_repo.dart';

part 'upcoming_movie_state.dart';

class UpcomingMovieCubit extends Cubit<UpcomingMovieState> {
  UpcomingMovieCubit(this.homeRepo) : super(UpcomingMovieInitial());
  final HomeRepo homeRepo;
  Future<void> fetchUpComing({int numpage = 1}) async {
    if (numpage == 1) {
      emit(UpcomingMovieLoading());
    } else {
      emit(UpcomingMovieLoadingpage());
    }
    var result = await homeRepo.fetchUpComing(numpage: numpage);
    result.fold((failure) {
      if (numpage == 1) {
        emit(UpcomingMovieFailure(failure.errMessage));
      } else {
        emit(UpcomingMovieFailurePage(failure.errMessage));
      }
    }, (movies) {
      emit(UpcomingMovieSuccess(movies));
    });
  }
}