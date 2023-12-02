import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/core/utils/text_style.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';

class ListSearch extends StatelessWidget {
  const ListSearch(
      {super.key,
      this.movieName,
      this.moivedate,
      this.movieRating,
      this.imageUrl});
  final String? movieName;
  final String? moivedate;
  final String? movieRating;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ImageList(
              imageUrl: imageUrl ?? '',
              radius: 16,
              heightImage: 130.h,
              widthImage: 105.w,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 200.w,
                  ),
                  child: Text(movieName ?? '', style: StyleText.textStyle15)),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(moivedate ?? '', style: StyleText.textStyle13),
                    SizedBox(
                      width: 6.w,
                    ),
                    const Icon(
                      Icons.star_rate,
                      color: textInfoColor,
                    ),
                    Text("($movieRating)", style: StyleText.textStyle13)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}