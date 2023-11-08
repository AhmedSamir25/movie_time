import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> fetchTrendMovies();
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieModel>>> fetchTopRated();
  Future<Either<Failure, List<MovieModel>>> fetchUpComing();
}
