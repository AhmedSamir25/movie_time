import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movietime/core/services/api_service.dart';
import 'package:movietime/features/home/data/repository/home_repo_impl.dart';
import 'package:movietime/features/home_detils/data/repository/home_details_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
    getIt.registerSingleton<HomeDetailsRepoImpl>(HomeDetailsRepoImpl(
    getIt.get<ApiService>(),
  ));
}
