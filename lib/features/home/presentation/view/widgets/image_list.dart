import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(image: AssetImage('assets/image/test.png',),
        fit: BoxFit.fill,

        )
      ),
    );
  }
}