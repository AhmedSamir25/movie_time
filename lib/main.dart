import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/router.dart';

void main() {
  runApp(const MovieTime());
}

class MovieTime extends StatelessWidget {
  const MovieTime({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
      return MaterialApp.router(
        routerConfig : AppRouter.router,
      );
      },
    );
  }
}