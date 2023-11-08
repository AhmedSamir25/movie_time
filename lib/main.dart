import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/router.dart';
import 'package:movietime/core/services/service_locator.dart';
import 'package:movietime/features/home/data/repository/home_repo_impl.dart';
import 'package:movietime/features/home/presentation/manager/movie_bloc/movies_cubit.dart';

void main() {
  runApp(const MovieTime());
}

class MovieTime extends StatelessWidget {
  const MovieTime({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MoviesCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchTrendMovies(),
            ),
            BlocProvider(
              create: (context) => MoviesCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchTopRated(),
            ),
            BlocProvider(
              create: (context) => MoviesCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchPopularMovies(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}