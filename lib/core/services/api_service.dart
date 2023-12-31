import 'package:dio/dio.dart';
import 'package:movietime/core/constant/strings.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint, required int numpage}) async {
    var response = await _dio.get(
        '${Strings.buseUrl}/movie/$endPoint?language=en-US&page=$numpage&api_key=${Strings.apiKey}');
    return response.data ;
  }

  Future<Map<String, dynamic>> gettrend() async {
    var response = await _dio.get(
        '${Strings.buseUrl}/trending/movie/day?language=en-U&api_key=${Strings.apiKey}');
    return response.data ;
  }

      Future<Map<String, dynamic>> getcirdets({required int id,}) async {
    var response = await _dio.get(
        '${Strings.buseUrl}/movie/$id/credits?language=en-US&api_key=${Strings.apiKey}');
    return response.data ;
  }
  
Future<Map<String, dynamic>> getSearch({required String query}) async {
    var response = await _dio.get(
        '${Strings.buseUrl}/search/movie?query=$query&api_key=${Strings.apiKey}');
    return response.data ;
  }
     Future<Map<String, dynamic>> getprofile({required int id}) async {
    var response = await _dio.get(
        '${Strings.buseUrl}/person/$id?language=en-US&api_key=${Strings.apiKey}');
    return response.data ;
  }
}