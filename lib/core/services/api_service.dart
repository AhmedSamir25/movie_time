import 'package:dio/dio.dart';

import '../constant/strings.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint, required int numpage}) async {
    var response = await _dio.get(
        '${Strings.buseUrl}movie/$endPoint?language=en-US&page=$numpage&api_key=${Strings.apiKey}');
    return response.data ;
  }
  Future<Map<String, dynamic>> gettrend() async {
    var response = await _dio.get(
        '${Strings.buseUrl}trending/movie/day?language=en-U&api_key=${Strings.apiKey}');
    return response.data ;
  }
}