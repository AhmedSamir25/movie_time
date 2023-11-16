import 'package:dartz/dartz.dart';
import 'package:movietime/core/errors/failure.dart';
import 'package:movietime/features/home_detils/data/model/cast_model.dart';

abstract class HomeDetailsRepo {
  Future<Either<Failure, List<CastModel>>> fetchCast({required int id});
}