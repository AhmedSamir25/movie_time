import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/color.dart';

abstract class StyleText {
   static TextStyle textStyle13 = TextStyle(
    fontSize: 13.sp,
    color: textInfoColor,
    fontWeight: FontWeight.w600
  );
  static TextStyle textStyle15 = TextStyle(
    fontSize: 15.sp,
    color: textAppColor,
  );
  static TextStyle textStyle20 =  TextStyle(
    fontSize: 20.sp,
    color: textAppColor,
  );
  static TextStyle textStyle40 =  TextStyle(
    fontSize: 45.sp,
    color: Colors.amberAccent,
    fontWeight: FontWeight.bold,
  );
}
