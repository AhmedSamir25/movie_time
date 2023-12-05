import 'package:flutter/material.dart';
import 'package:movietime/core/utils/style/text_style.dart';


class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: StyleText.textStyle20,
      ),
    );
  }
}
