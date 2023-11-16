import 'package:flutter/material.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/cover_name_movie.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/home_detils_tabs.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/info_movie.dart';

class HomeViewDetilsBody extends StatelessWidget {
  const HomeViewDetilsBody({super.key, required this.movieModel});
   final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CoverNameMovie(
          imageUrl:movieModel.posterPath,
          nameMovie: movieModel.originalTitle,
        ),
        InfoMovie(
          year: movieModel.releaseDate,
          voteCount: movieModel.voteCount,
          voteAverage: movieModel.voteAverage,
        ),
        HomeDetailsTabs(aboutMovie: movieModel.overview),
      ],
    );
  }
}