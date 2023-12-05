import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movietime/core/router/router.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/core/utils/text_style.dart';
import 'package:movietime/core/utils/widgets/custom_error_widget.dart';
import 'package:movietime/core/utils/widgets/custom_loading.dart';
import 'package:movietime/features/home/presentation/manager/trend_cubit/trendmovie_cubit.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';

class ListBuilderHome extends StatelessWidget {
  const ListBuilderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendMoviesCubit, TrendMoviesState>(
      builder: (context, state) {
        if (state is TrendMoviesSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.detailsView,
                  extra: state.movies[index],
                );
              },
              child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Stack(
                    children: [
                      ImageList(
                        imageUrl: state.movies[index].posterPath!,
                        heightImage: 200.h,
                        widthImage: 200.w,
                        radius: 16,
                      ),
                      Positioned(
                        top: 138.h,
                        left: 13.w,
                        child: Text(
                          (index + 1).toString(),
                          style: StyleText.textStyle45.copyWith(
                            fontFamily: 'PT Serif',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 4.0
                              ..color = numberListColor,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            itemCount: 20,
            scrollDirection: Axis.horizontal,
          );
        } else if (state is TrendMoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => const LoadingShimmer(
              widthScreen: 0.66,
              heightScreen: 0.35,
            ),
            itemCount: 20,
            scrollDirection: Axis.horizontal,
          );
        }
      },
    );
  }
}