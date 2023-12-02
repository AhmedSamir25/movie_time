import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/core/utils/widgets/custom_error_widget.dart';
import 'package:movietime/core/utils/widgets/custom_loading.dart';
import 'package:movietime/features/home_detils/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/cast_info.dart';

class CastGridView extends StatelessWidget {
  const CastGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastMovieCubit, CastMovieState>(
      builder: (context, state) {
        if(state is CastMovieSuccess){
                  return GridView.builder(
          itemBuilder: (context, index) => CastInof(
            imageUrl: state.cast[index].profilePath??'',
            castName: state.cast[index].name??'Unknow',
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: state.cast.length,
        );
        }else if (state is CastMovieFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return GridView.builder(
            itemBuilder: (context, index) => const LoadingShimmer(
              widthScreen: 0.9,
              heightScreen: 0.35,
            ),
            itemCount:20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        }
      },
    );
  }
}
