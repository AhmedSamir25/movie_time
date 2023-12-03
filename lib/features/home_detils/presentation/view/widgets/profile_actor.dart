import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/features/home_detils/data/model/cast_model.dart';
import 'package:movietime/features/home_detils/presentation/manager/profile_actor_cubit/profile_actor_cubit.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/profile_actor_detils.dart';

class ProfileActor extends StatefulWidget {
  const ProfileActor({super.key, required this.castModel});
  final CastModel castModel;

  @override
  State<ProfileActor> createState() => _ProfileActorState();
}

class _ProfileActorState extends State<ProfileActor> {
  @override
  void initState() {
    BlocProvider.of<ProfileActorCubit>(context).fetchProfile(
      id: widget.castModel.id!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileActorDetils(
        
      ),
    );
  }
}
