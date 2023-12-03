import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/text_style.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 240.w),
        child: Text('What do you want to watch ?',style: StyleText.textStyle20,)));
  }
}