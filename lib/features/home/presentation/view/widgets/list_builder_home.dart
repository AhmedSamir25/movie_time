import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/text_style.dart';
import 'package:movietime/features/home/presentation/manager/movie_bloc/movies_cubit.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';
import '../../../../../core/utils/widgets/custom_error_widget.dart';
import '../../../../../core/utils/widgets/custom_loading.dart';

class ListBuilderHome extends StatelessWidget {
  const ListBuilderHome({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is TrendMoviesSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: 10.0.w),
                child: Stack(
                  children: [
                    ImageList(
                      imageUrl: state.movies[index].posterPath,
                    ),
                    Positioned(
                      top: 138.h,
                      left: 13.w,
                      child: Text(
                        (index + 1).toString(),
                        style: StyleText.textStyle40,
                      ),
                    ),
                  ],
                )),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          );
        } else if (state is PopularMoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => const LoadingShimmer(
              widthScreen: 0.9,
              heightScreen: 0.35,
            ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          );
        }
      },
    );
  }
}