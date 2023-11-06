import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelPadding: EdgeInsets.only(right: 40.w),
            labelColor: Colors.white,
            dividerColor: Colors.black,
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Top rated'),
              Tab(text: 'Populor'),
            ],
          ),
          SizedBox(
            width: double.maxFinite,
            height: 250.h,
            child: TabBarView(
              children: [
                GridView.builder(
                    itemBuilder: (context, index) => const ImageList(),
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3)),
                ListView.builder(
                  itemBuilder: (context, index) => const ImageList(),
                  itemCount: 10,
                ),
                ListView.builder(
                  itemBuilder: (context, index) => const ImageList(),
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}