import 'package:flutter/material.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/core/utils/text_style.dart';

ThemeData getTheme()=> ThemeData(
  primaryColor: appColor,
  colorScheme: ColorScheme.light(background: Colors.blueGrey.shade600),
  textTheme: TextTheme(
    displayMedium: StyleText.textStyle15,
    displaySmall: StyleText.textStyle15,
    titleSmall: StyleText.textStyle15,
    bodyMedium: StyleText.textStyle20,
    titleMedium: const TextStyle(
      fontSize: 22,
    )
  )
);