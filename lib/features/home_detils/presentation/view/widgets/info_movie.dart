import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/style/color.dart';
import 'package:movietime/core/utils/style/text_style.dart';

class InfoMovie extends StatelessWidget {
  const InfoMovie({super.key, required this.year,required this.voteAverage, required this.voteCount});
  final String year;
  final double voteAverage;
  final int voteCount;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 11),
      child: Row(
        children: [
          const Spacer(flex: 1,),
          const Icon(Icons.calendar_month,color: textInfoColor,size: 25,),
          SizedBox(width: 5.w,),
          Text(year,style: StyleText.textStyle13),
          const Spacer(flex: 1,),
          Text('|',style: StyleText.textStyle20.copyWith(color: textInfoColor),),
          const Spacer(flex: 1,),
          const Icon(Icons.star,color: textInfoColor,size: 25,),
          Text('(${voteAverage.toString()})',style: StyleText.textStyle13),
          SizedBox(width: 4.h,),
          Text(voteCount.toString(),style: StyleText.textStyle13),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}