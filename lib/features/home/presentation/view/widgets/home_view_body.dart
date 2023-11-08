import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/features/home/presentation/view/widgets/custom_appbar.dart';
import 'package:movietime/features/home/presentation/view/widgets/home_tabs.dart';
import 'package:movietime/features/home/presentation/view/widgets/list_builder_home.dart';
import 'package:movietime/features/home/presentation/view/widgets/search_from_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 50.h, right: 16.w, left: 16.w),
      child: ListView(
        children: [
          const CustomHomeAppBar(),
          SizedBox(
            height: 15.h,
          ),
          const SearchFromField(),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 215.h,
            child: const ListBuilderHome(
            
            ),
          ),
          const Expanded(
            child: HomeTabs(
            )),
        ],
      ),
    );
  }
}