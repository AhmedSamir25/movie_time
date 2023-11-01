import 'package:flutter/material.dart';
import 'package:movietime/features/home/presentation/view/widgets/custom_appbar.dart';
import 'package:movietime/features/home/presentation/view/widgets/list_builder_home.dart';
import 'package:movietime/features/home/presentation/view/widgets/search_from_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: 50,right: 16, left: 16),
      child:  Column(
        children: [
          CustomHomeAppBar(),
          SizedBox(height: 15,),
          SearchFromField(),
          SizedBox(height: 15,),
          SizedBox(
            height: 200,
            width: 410,
            child: ListBuilderHome()),
        ],
      ),
    );
  }
}