part of 'profile_actor_cubit.dart';

sealed class ProfileActorState extends Equatable {
  const ProfileActorState();

  @override
  List<Object> get props => [];
}

final class ProfileActorInitial extends ProfileActorState {}
final class ProfileActorLoading extends ProfileActorState {
}
final class ProfileActorFailure extends ProfileActorState {
  final String errMessage;

  const ProfileActorFailure(this.errMessage);
}
final class ProfileActorSuccess extends ProfileActorState {
  final List<ProfileModel> profile;

  const ProfileActorSuccess(this.profile);
}