import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movietime/features/home/data/repository/home_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../model/movie_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchTrendMovies() async {
    try {
      var data = await apiService.gettrend();
      List<MovieModel> movies = [];
      for (var results in data['results']) {
        try {
          movies.add(MovieModel.fromJson(results));
        } catch (e) {
          movies.add(MovieModel.fromJson(results));
        }
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }



   @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRated({int numpage = 1}) async {
    try {
      var data = await apiService.get(endPoint: 'top_rated', numpage: numpage);
      List<MovieModel> movies = [];
      for (var results in data['results']) {
        try {
          movies.add(MovieModel.fromJson(results));
        } catch (e) {
          movies.add(MovieModel.fromJson(results));
        }
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies({int numpage = 1}) async {
    try {
      var data = await apiService.get(endPoint: 'popular', numpage: numpage);
      List<MovieModel> movies = [];
      for (var results in data['results']) {
        try {
          movies.add(MovieModel.fromJson(results));
        } catch (e) {
          movies.add(MovieModel.fromJson(results));
        }
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<MovieModel>>> fetchUpComing({int numpage = 1}) async{
    try {
      var data = await apiService.get(endPoint: 'upcoming', numpage: numpage);
      List<MovieModel> movies = [];
      for (var results in data['results']) {
        try {
          movies.add(MovieModel.fromJson(results));
        } catch (e) {
          movies.add(MovieModel.fromJson(results));
        }
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<MovieModel>>> fetchSearch({ required String query}) async{
    try {
      var data = await apiService.getSearch( query: query);
      List<MovieModel> movies = [];
      for (var results in data['results']) {
        try {
          movies.add(MovieModel.fromJson(results));
        } catch (e) {
          movies.add(MovieModel.fromJson(results));
        }
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}