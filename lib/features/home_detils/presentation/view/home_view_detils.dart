import 'package:flutter/material.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/home_view_detils_body.dart';

class HomeDetilsView extends StatelessWidget {
  const HomeDetilsView({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text('Details')),
        backgroundColor: appColor,
        elevation: 0,
        ),
      body: HomeViewDetilsBody(
        movieModel: movieModel ,
      ) ,
    );
  }
}