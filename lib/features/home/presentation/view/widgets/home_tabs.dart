import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/style/color.dart';
import 'package:movietime/features/home/presentation/view/widgets/populre_gridview.dart';
import 'package:movietime/features/home/presentation/view/widgets/toprated_gird_view.dart';
import 'package:movietime/features/home/presentation/view/widgets/upcoming_gird_view.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabBar(
            labelPadding:  EdgeInsets.only(right: 36),
            labelColor: textAppColor,
            indicatorColor: lineTabColor,
            tabs:  [
              Tab(text: 'Upcoming',),
              Tab(text: 'Top rated'),
              Tab(text: 'Populor'),
            ],
          ),
          SizedBox(
            width: double.maxFinite,
            height: 230.h,
            child: const Expanded(
              child:  TabBarView(
                children: [
                  UpcomingGridView(),
                  TopRatedGridView(),
                  PopularGridView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}