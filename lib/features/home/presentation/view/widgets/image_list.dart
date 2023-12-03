import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key, required this.imageUrl,  this.heightImage,  this.widthImage, required this.radius});
  final String imageUrl;
  final double ? heightImage;
  final double ?widthImage;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightImage,
      width: widthImage,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(image:
        NetworkImage(imageUrl),
        fit: BoxFit.fill,
        )
      ),
    );
  }
}