import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer(
      {super.key, required this.widthScreen, this.heightScreen});
  final double? widthScreen;
  final double? heightScreen;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthScreen!,
      height: MediaQuery.of(context).size.height * heightScreen!,
      child: Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}

class AvatarShimer extends StatelessWidget {
  const AvatarShimer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.grey,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 55,
          ),
        ),
      ),
    );
  }
}
