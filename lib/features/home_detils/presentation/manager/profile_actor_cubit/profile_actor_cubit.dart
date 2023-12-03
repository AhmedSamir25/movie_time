import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietime/features/home_detils/data/model/profile_actor_model.dart';
import 'package:movietime/features/home_detils/data/repository/home_details_repo.dart';

part 'profile_actor_state.dart';

class ProfileActorCubit extends Cubit<ProfileActorState> {
  ProfileActorCubit(this.homeDetailsRepo) : super(ProfileActorInitial());
  final HomeDetailsRepo homeDetailsRepo;
  
  Future<void> fetchProfile({required int id}) async{
     var profile = await homeDetailsRepo.fetchProfile(id: id);
    profile.fold((failure) {
      emit(ProfileActorFailure(failure.errMessage));
    }, (profile) {
      emit(ProfileActorSuccess(profile));
    });
  }
}