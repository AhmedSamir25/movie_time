import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/router.dart';
import 'package:movietime/core/services/service_locator.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/features/home/data/repository/home_repo_impl.dart';
import 'package:movietime/features/home/presentation/manager/movie_bloc/poupler_movies_cubit.dart';
import 'package:movietime/features/home/presentation/manager/toprated_cubit/toprated_cubit.dart';
import 'package:movietime/features/home/presentation/manager/trend_cubit/trendmovie_cubit.dart';
import 'package:movietime/features/home/presentation/manager/upcoming_movie/upcoming_movie_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const MovieTime());
}

class MovieTime extends StatelessWidget {
  const MovieTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TrendMoviesCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchTrendMovies(),
            ),
            BlocProvider(
              create: (context) => TopRatedCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchTopRated(),
            ),
            BlocProvider(
              create: (context) => PouplerMoviesCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchPopularMovies(),
            ),
            BlocProvider(
              create: (context) => UpcomingMovieCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchUpComing(),
            ),
          ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              theme: ThemeData(
                scaffoldBackgroundColor: appColor,
              ),
              routerConfig: AppRouter.router,
            );
          }),
    );
  }
}
