import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/widgets/custom_error_widget.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';
import '../../../../../core/utils/widgets/custom_loading.dart';
import '../../manager/toprated_cubit/toprated_cubit.dart';

class TopRatedGridView extends StatelessWidget {
  const TopRatedGridView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if(state is TopRatedSuccess){
          return GridView.builder(
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(left: 10.w, bottom: 7.h),
                  child: ImageList(
                    imageUrl: state.movies[index].posterPath,
                  ),
                ),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3));
        }else if(state is TopRatedFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return GridView.builder(
            itemBuilder: (context, index) => const LoadingShimmer(
              widthScreen: 0.9,
              heightScreen: 0.35,
            ),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3)
          );
        }
        
      },
    );
  }
}
