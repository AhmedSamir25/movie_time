import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home/data/repository/home_repo.dart';

part 'search_state.dart';



class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  SearchMoviesCubit(this.homeRepo) : super(SearchMoviesInitial());
  final HomeRepo homeRepo;
      Future<void> fetchSearch(String query) async {
    var result = await homeRepo.fetchSearch(query: query);
    result.fold((failure) {
      emit(SearchMoviesFailure(failure.errMessage));
    }, (movies) {
      emit(SearchMoviesSuccess(movies));
    });
  }
}
