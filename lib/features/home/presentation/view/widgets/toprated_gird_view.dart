import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movietime/core/router.dart';
import 'package:movietime/core/utils/widgets/custom_error_widget.dart';
import 'package:movietime/core/utils/widgets/custom_loading.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home/presentation/manager/toprated_cubit/toprated_cubit.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';

class TopRatedGridView extends StatefulWidget {
  const TopRatedGridView({Key? key}) : super(key: key);

  @override
  State<TopRatedGridView> createState() => _TopRatedGridViewState();
}

class _TopRatedGridViewState extends State<TopRatedGridView>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;
  int nextPage = 1;
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
        await BlocProvider.of<TopRatedCubit>(context)
            .fetchTopRated(numpage: nextPage++);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<TopRatedCubit, TopRatedState>(
      listener: (context, state) {
        if (state is TopRatedSuccess) {
          for (var movie in state.movies) {
            if (!movies.contains(movie)) {
              movies.add(movie);
            }
          }

          isLoading = false;
        }
        if (state is TopRatedFailurePage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.errMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TopRatedSuccess) {
          return GridView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.detailsView,
                  extra: state.movies[index],
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.w, bottom: 7.h),
                child: ImageList(
                  imageUrl: movies[index].posterPath,
                  heightImage: 100.h,
                  widthImage: 100.w,
                  radius: 16,
                ),
              ),
            ),
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        } else if (state is TopRatedFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return GridView.builder(
            itemBuilder: (context, index) => const LoadingShimmer(
              widthScreen: 0.9,
              heightScreen: 0.35,
            ),
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        }
      },
    );
  }
}