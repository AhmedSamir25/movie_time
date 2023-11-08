import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movietime/core/services/api_service.dart';
import 'package:movietime/features/home/data/repository/home_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  // تسجيل ApiService أولاً
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // ثم تسجيل HomeRepoImpl باستخدام ApiService المسجلة مسبقًا
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}
