import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/core/utils/text_style.dart';

class CastInof extends StatelessWidget {
  const CastInof({super.key, required this.imageUrl, required this.castName});
  final String imageUrl;
  final String castName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 45,
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 150,
              ),
              child: Text(castName,maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: StyleText.textStyle13.copyWith(color: textAppColor),),
            ),
          ),
        ],
      ),
    );
  }
}