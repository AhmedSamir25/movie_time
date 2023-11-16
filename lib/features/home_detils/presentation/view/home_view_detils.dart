import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home_detils/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/home_view_detils_body.dart';

class HomeDetilsView extends StatefulWidget {
  const HomeDetilsView({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  State<HomeDetilsView> createState() => _HomeDetilsViewState();
}

class _HomeDetilsViewState extends State<HomeDetilsView> {
  @override
  void initState() {
     BlocProvider.of<CastMovieCubit>(context).featchCast(
        id: widget.movieModel.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text('Details')),
        backgroundColor: appColor,
        elevation: 0,
        ),
      body: HomeViewDetilsBody(
        movieModel: widget.movieModel ,
      ) ,
    );
  }
}