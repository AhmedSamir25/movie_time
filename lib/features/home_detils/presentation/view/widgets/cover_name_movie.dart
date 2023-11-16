import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/text_style.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';

class CoverNameMovie extends StatelessWidget {
  const CoverNameMovie({super.key, required this.imageUrl, required this.nameMovie});
  final String imageUrl;
  final String nameMovie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: ImageList(
              imageUrl: imageUrl,
              heightImage: 170.h,
              widthImage: double.infinity,
              radius: 0,
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            child: Row(
              children: [
                ImageList(
                  imageUrl: imageUrl,
                  heightImage: 120.h,
                  widthImage: 115.w,
                  radius: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0.h,left: 12.w),
                  child: Text(nameMovie,style: StyleText.textStyle20,),
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}