import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/movie_model.dart';
import '../../../data/repository/home_repo.dart';

part 'toprated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.homeRepo) : super(TopRatedInitial());
  final HomeRepo homeRepo;
  Future<void> fetchTopRated({int numpage = 1}) async {
    if (numpage == 1) {
      emit(TopRatedLoading());
    } else {
      emit(TopRatedLoadingpage());
    }
    var result = await homeRepo.fetchTopRated(numpage: numpage);
    result.fold((failure) {
      if (numpage == 1) {
        emit(TopRatedFailure(failure.errMessage));
      } else {
        emit(TopRatedFailurePage(failure.errMessage));
      }
    }, (movies) {
      emit(TopRatedSuccess(movies));
    });
  }
}