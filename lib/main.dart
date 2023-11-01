import 'package:flutter/material.dart';
import 'package:movietime/core/router.dart';

void main() {
  runApp(const MovieTime());
}

class MovieTime extends StatelessWidget {
  const MovieTime({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig : AppRouter.router,
    );
  }
}