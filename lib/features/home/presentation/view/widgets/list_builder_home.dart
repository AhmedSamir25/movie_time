import 'package:flutter/material.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';

class ListBuilderHome extends StatelessWidget {
  const ListBuilderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemBuilder: (context, index) => const Padding(
        padding:  EdgeInsets.only(right: 10.0),
        child:  ImageList(),
      ),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
    );
  }
}

