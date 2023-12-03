import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/core/utils/text_style.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 40.h,
          decoration: BoxDecoration(
            color: textAppColor,
            borderRadius: BorderRadius.circular(16),),
          child: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Search',
              style: StyleText.textStyle15.copyWith(color: textButton)),
            ),
          ),
        );
  }
}