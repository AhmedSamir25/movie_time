import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key, required this.imageUrl});
  final String imageUrl; 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image:
        NetworkImage('https://www.themoviedb.org/t/p/w220_and_h330_face$imageUrl'),
        fit: BoxFit.fill,

        )
      ),
    );
  }
}