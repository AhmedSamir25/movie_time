import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movietime/core/router/router.dart';
import 'package:movietime/core/utils/style/color.dart';
import 'package:movietime/core/utils/widgets/custom_error_widget.dart';
import 'package:movietime/core/utils/widgets/custom_loading.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home/presentation/manager/upcoming_movie/upcoming_movie_cubit.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';

class UpcomingGridView extends StatefulWidget {
  const UpcomingGridView({Key? key}) : super(key: key);

  @override
  State<UpcomingGridView> createState() => _TopRatedGridViewState();
}

class _TopRatedGridViewState extends State<UpcomingGridView>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;
  int nextPage = 2;
  bool isLoading = false;
  List<MovieModel> movies = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.6 * maxScrollLength) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        await BlocProvider.of<UpcomingMovieCubit>(context)
            .fetchUpComing(numpage: nextPage++);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<UpcomingMovieCubit, UpcomingMovieState>(
      listener: (context, state) {
        if (state is UpcomingMovieSuccess) {
          movies.addAll(state.movies);
          isLoading = false;
        }
        if (state is UpcomingMovieFailurePage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: errorColor,
              content: Text(
                state.errMessage,
                style: const TextStyle(color: textAppColor),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is UpcomingMovieSuccess ||
            state is UpcomingMovieFailurePage ||
            state is UpcomingMovieLoadingpage) {
          return GridView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.detailsView,
                  extra: movies[index],
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, bottom: 7),
                child: ImageList(
                  imageUrl: movies[index].posterPath!,
                  radius: 16,
                ),
              ),
            ),
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 185,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 5,
              mainAxisExtent: 180,
            ),
          );
        } else if (state is UpcomingMovieFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else{
          return GridView.builder(
            itemBuilder: (context, index) => const LoadingShimmer(),
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 185,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 5,
              mainAxisExtent: 180,
            ),
          );
        }
      },
    );
  }
}
