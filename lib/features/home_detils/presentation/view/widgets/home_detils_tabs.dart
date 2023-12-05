import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/style/color.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/cast_gridview.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/contect_tabs.dart';

class HomeDetailsTabs extends StatelessWidget {
  const HomeDetailsTabs({super.key, required this.aboutMovie, });
  final String aboutMovie;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 27,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              labelColor: textAppColor,
              indicatorColor: lineTabColor,
              tabs:  [
                Tab(text: 'About'),
                Tab(text: 'cast'),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              height: 320.h,
              child:  TabBarView(
                children: [
                ContectTabs(aboutMovie:aboutMovie ),
                const CastGridView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}