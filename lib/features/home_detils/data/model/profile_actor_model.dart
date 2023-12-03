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
      biography: json['biography'],
      birthday: json['birthday'],
      deathday: json['deathday']??'',
      id: json['id'],
      name: json['name'],
      placeOfBirth: json['place_of_birth'],
      profilePath: json['profile_path'] == null ?"https://img.freepik.com/free-photo/surprised-happy-bearded-man-shirt-pointing-away_171337-5021.jpg?w=740&t=st=1701533025~exp=1701533625~hmac=e86cc993f60544d9b39b539993b4a9fcd15f3e6919d481c50a765c7a8570af08":"https://www.themoviedb.org/t/p/w220_and_h330_face${json['profile_path']}",
      
    );
  }
}