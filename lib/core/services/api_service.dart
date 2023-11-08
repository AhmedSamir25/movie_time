import 'package:dio/dio.dart';

class ApiService {
    final  String apiKey = "536aef7409e681e9376befeb6a82f85c";
    final String _buseUrl = "https://api.themoviedb.org/3"; 
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint, required int numpage}) async {
    var response = await _dio.get(
        '$_buseUrl/movie/$endPoint?language=en-US&page=$numpage&api_key=$apiKey');
    return response.data ;
  }
  Future<Map<String, dynamic>> gettrend() async {
    var response = await _dio.get(
        'https://api.themoviedb.org/3/trending/movie/day?language=en-U&api_key=$apiKey');
    return response.data ;
  }
}