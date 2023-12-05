class MovieModel {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;

  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'] == null ?"https://img.freepik.com/free-vector/yellow-danger-warning-sign-vector-art-illustration_56104-872.jpg?w=740&t=st=1701613349~exp=1701613949~hmac=07e8db21af9a1d775f97bac94c2e6c069da8aa66f549883f8df713d7ffda6d7b":"https://www.themoviedb.org/t/p/w220_and_h330_face${json['poster_path']}",
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}