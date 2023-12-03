class ProfileModel {
  final String biography;
  final String birthday;
  final String? deathday;
  final int id;
  final String name;
  final String placeOfBirth;
  final String profilePath;

  ProfileModel({
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.id,
    required this.name,
    required this.placeOfBirth,
    required this.profilePath,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      biography: json['biography']??'',
      birthday: json['birthday']??'',
      deathday: json['deathday']??'',
      id: json['id']??'',
      name: json['name']??'',
      placeOfBirth: json['place_of_birth']??'',
      profilePath: json['profile_path'] == null ?"https://img.freepik.com/free-photo/user-profile-icon-front-side_187299-39596.jpg?w=740&t=st=1701613754~exp=1701614354~hmac=1effee8ddfe85c497366a6f7e552532025c8986be27964631ccd249922163f4d":"https://www.themoviedb.org/t/p/w220_and_h330_face${json['profile_path']}",
      
    );
  }
}