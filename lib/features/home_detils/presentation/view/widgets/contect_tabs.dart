import 'package:flutter/material.dart';
import 'package:movietime/core/utils/text_style.dart';

class ContectTabs extends StatelessWidget {
  const ContectTabs({super.key, required this.aboutMovie});
  final String aboutMovie;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:16.0),
      child:  Text(aboutMovie,style: StyleText.textStyle15,),
    );
  }
}