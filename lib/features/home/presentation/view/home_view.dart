import 'package:flutter/material.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: appColor,
      body:  HomeViewBody(),
    );
  }
}