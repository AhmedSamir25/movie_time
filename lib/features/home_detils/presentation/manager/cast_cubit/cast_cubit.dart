import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/features/home_detils/data/model/cast_model.dart';
import 'package:movietime/features/home_detils/data/repository/home_details_repo.dart';

part 'cast_state.dart';

class CastMovieCubit extends Cubit<CastMovieState> {
  CastMovieCubit(this.homeDetailsRepo) : super(CastMovieInitial());
  final HomeDetailsRepo homeDetailsRepo;
  Future<void>featchCast({required int id})async{
    var cast = await homeDetailsRepo.fetchCast(id : id);
    cast.fold((failure){
      emit(CastMovieFailure(failure.errMessage));
    },
    (cast) {
      emit(CastMovieSuccess(cast));
  });
}
}