import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/widgets/custom_error_widget.dart';
import 'package:movietime/core/utils/widgets/custom_loading.dart';
import 'package:movietime/features/home/data/model/movie_model.dart';
import 'package:movietime/features/home/presentation/manager/poup;er_cubit/poupler_movies_cubit.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';

class PopularGridView extends StatefulWidget {
  const PopularGridView({Key? key}) : super(key: key);

  @override
  State<PopularGridView> createState() => _TopRatedGridViewState();
}

class _TopRatedGridViewState extends State<PopularGridView> with AutomaticKeepAliveClientMixin {
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
        await BlocProvider.of<PouplerMoviesCubit>(context).fetchPopularMovies(numpage: nextPage++);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // يُحسن هذا السطر الأداء
    return BlocConsumer<PouplerMoviesCubit, PouplerMoviesState>(
      listener: (context, state) {
        if (state is PouplerMoviesSuccess) {
          movies.addAll(state.movies);
          // قم بتحديث isLoading إلى false بعد إضافة البيانات
          isLoading = false;
        }
        if (state is PouplerMoviesFailurePage) {
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
        if (state is PouplerMoviesSuccess ||
            state is PouplerMoviesFailurePage ||
            state is PouplerMoviesLoadingpage) {
          return GridView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(left: 10.w, bottom: 7.h),
              child: ImageList(
                imageUrl: movies[index].posterPath,
              ),
            ),
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        } else if (state is PouplerMoviesFailure) {
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