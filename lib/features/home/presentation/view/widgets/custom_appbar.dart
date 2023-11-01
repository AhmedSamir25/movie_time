import 'package:flutter/material.dart';
import 'package:movietime/core/utils/text_style.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: Text('What do you want to watch ?',style: StyleText.textStyle20,));
  }
}