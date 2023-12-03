import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/core/utils/text_style.dart';

class InformatiomActor extends StatelessWidget {
  const InformatiomActor({super.key, required this.birthday, this.deathday, required this.placeOfBirth, required this.biography});
  final String birthday;
  final String? deathday;
  final String placeOfBirth;
  final String biography;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Column(
        children: [
          Row(
           children:[ 
          IconAndTextActor(icon:Icons.calendar_month ,text: birthday,),
          SizedBox(width: 7.w,),
            IconAndTextActor(text: deathday??''),
            ],
          ),
          SizedBox(height: 7.h,),
          IconAndTextActor(icon: Icons.home,text: placeOfBirth,),
          SizedBox(height: 10.h,),
          Container(
            constraints:  BoxConstraints(maxWidth: 420.w),
            child: Text(biography,style: StyleText.textStyle13,maxLines: 12,)),
        ],
      ),
    );
  }
}
class IconAndTextActor extends StatelessWidget {
  const IconAndTextActor({super.key, required this.text, this.icon});
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 30,color: textInfoColor,),
        SizedBox(width: 6.w,),
        Container(
          constraints: BoxConstraints(
            maxWidth: 310.w,
          ),
          child: Text(text,
          maxLines: 2,
          overflow:TextOverflow.ellipsis,
          style: StyleText.textStyle15.copyWith(color: textInfoColor, fontWeight: FontWeight.w500),),
        ),
      ],
    );
  }
}