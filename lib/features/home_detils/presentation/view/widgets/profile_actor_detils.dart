import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/core/utils/widgets/custom_error_widget.dart';
import 'package:movietime/core/utils/widgets/profile_actor_loading.dart';
import 'package:movietime/features/home_detils/presentation/manager/profile_actor_cubit/profile_actor_cubit.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/custom_app_bar.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/image_name_movie.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/informatiom_actor.dart';

class ProfileActorDetils extends StatelessWidget {
  const ProfileActorDetils({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          BlocBuilder<ProfileActorCubit, ProfileActorState>(
            builder: (context, state) {
              if (state is ProfileActorSuccess) {
                return ListView(
                  children: [
                    CoverNameMovieActor(
                      imageUrl: state.profile[0].profilePath,
                      nameMovie: state.profile[0].name,
                    ),
                    InformatiomActor(
                      birthday: state.profile[0].birthday,
                      placeOfBirth: state.profile[0].placeOfBirth,
                      biography: state.profile[0].biography,
                    ),
                  ],
                );
              } else if (state is ProfileActorFailure) {
                return CustomErrorWidget(errMessage: state.errMessage);
              } else {
                return const Center(child: CircularProgressLoading(),);
              }
            },
          ),
          const CustomAppBar(),
        ],
      ),
    );
  }
}