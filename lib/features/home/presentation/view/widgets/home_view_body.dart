import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movietime/core/router/router.dart';
import 'package:movietime/core/utils/text_style.dart';
import 'package:movietime/features/home/presentation/view/widgets/custom_appbar.dart';
import 'package:movietime/features/home/presentation/view/widgets/home_tabs.dart';
import 'package:movietime/features/home/presentation/view/widgets/search_button.dart';
import 'package:movietime/features/home/presentation/view/widgets/trend_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 16, left: 16),
      child: Column(
        children: [
          const CustomHomeAppBar(),
          SizedBox(
            height: 15.h,
          ),
          GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.searchView,
                );
              },
              child: const SearchButton()),
            SizedBox(
            height: 15.h,
          ),
              Text('Trend Now',style:StyleText.textStyle15 ,),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 215.h,
            child: const ListBuilderHome(),
          ),
          const HomeTabs(),
        ],
      ),
    );
  }
}