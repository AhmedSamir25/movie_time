import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movietime/core/router/router.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/core/utils/widgets/custom_error_widget.dart';
import 'package:movietime/core/utils/widgets/custom_loading.dart';
import 'package:movietime/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movietime/features/search/presentation/view/widgets/list_search.dart';

class SearchViewResults extends StatelessWidget {
  const SearchViewResults({super.key, });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Search Results')),
        backgroundColor: appColor,
        actions: [IconButton(onPressed:(){
          Navigator.pop(context);
        } , icon: const Icon(Icons.search))],
      ),
      body: BlocBuilder<SearchMoviesCubit , SearchMoviesState>(
      builder: (context, state) {
        if (state is SearchMoviesSuccess) {
        return ListView.builder(
          itemCount: state.movies.length,
          scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
                  AppRouter.detailsView,
                  extra: state.movies[index],
                );
          },
          child: ListSearch(
            imageUrl: state.movies[index].posterPath,
            movieName: state.movies[index].title,
            moivedate: state.movies[index].releaseDate,
            movieRating: state.movies[index].voteAverage.toString(),
          ),
        ) ,
      );
        }
        else if (state is SearchMoviesFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else{
          return ListView.builder(
            itemBuilder: (context, index) => const LoadingShimmer(
              widthScreen: 0.2,
              heightScreen: 0.2,
            ),
            itemCount: 15,
            scrollDirection: Axis.vertical,
          );
        }
      },
    ),
    ); }
}