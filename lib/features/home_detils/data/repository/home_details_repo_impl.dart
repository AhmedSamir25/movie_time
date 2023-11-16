import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movietime/core/errors/failure.dart';
import 'package:movietime/core/services/api_service.dart';
import 'package:movietime/features/home_detils/data/model/cast_model.dart';
import 'package:movietime/features/home_detils/data/repository/home_details_repo.dart';

class HomeDetailsRepoImpl extends HomeDetailsRepo{
   final ApiService apiService;
  HomeDetailsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<CastModel>>> fetchCast({required int id}) async {
    try {
      var data = await apiService.getcirdets(id: id);
      List<CastModel> castmovies = [];
      for (var cast in data['cast']) {
        castmovies.add(CastModel.fromJson(cast));
      }
      return right(castmovies);
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
  