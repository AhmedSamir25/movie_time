import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home/data/repository/home_repo.dart';

part 'upcoming_movie_state.dart';

class UpcomingMovieCubit extends Cubit<UpcomingMovieState> {
  UpcomingMovieCubit(this.homeRepo) : super(UpcomingMovieInitial());
   final HomeRepo homeRepo;
  Future<void> fetchUpComing() async {
    var result = await homeRepo.fetchUpComing();
    result.fold((failure) {
      emit(UpcomingMovieFailure(failure.errMessage));
    }, (movies) {
      emit(UpcomingMovieSuccess(movies));
    });
  }
}

