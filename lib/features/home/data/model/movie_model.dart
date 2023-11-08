import 'dart:convert';

class MovieModel {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
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
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(

      backdropPath: json['backdrop_path']??'',
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

void main() {
  var jsonString = '';
  var jsonData = json.decode(jsonString);
  List<MovieModel> movies = [];
  for (var movieData in jsonData['results']) {
    movies.add(MovieModel.fromJson(movieData));
  }
}
