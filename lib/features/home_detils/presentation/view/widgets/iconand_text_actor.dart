import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/core/utils/text_style.dart';

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