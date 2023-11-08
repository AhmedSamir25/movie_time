import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/movie_model.dart';
import '../../../data/repository/home_repo.dart';

part 'toprated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.homeRepo) : super(TopRatedInitial());
  final HomeRepo homeRepo;
  Future<void> fetchTopRated() async {
    var result = await homeRepo.fetchTopRated();
    result.fold((failure) {
      emit(TopRatedFailure(failure.errMessage));
    }, (movies) {
      emit(TopRatedSuccess(movies));
    });
  }
}