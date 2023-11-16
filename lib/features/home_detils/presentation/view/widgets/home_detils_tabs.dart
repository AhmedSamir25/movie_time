import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/contect_tabs.dart';

class HomeDetailsTabs extends StatelessWidget {
  const HomeDetailsTabs({super.key, required this.aboutMovie, });
  final String aboutMovie;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding:  EdgeInsets.only(top: 25.h,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
              labelColor: textAppColor,
              indicatorColor: lineTabColor,
              tabs: const [
                Tab(text: 'About'),
                Tab(text: 'Reviews'),
                Tab(text: 'cast'),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              height: 250.h,
              child:  TabBarView(
                children: [
                ContectTabs(aboutMovie:aboutMovie ),
                const ContectTabs(aboutMovie: ''),
                const ContectTabs(aboutMovie: ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}