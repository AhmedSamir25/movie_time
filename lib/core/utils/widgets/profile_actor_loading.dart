import 'package:flutter/material.dart';

class CircularProgressLoading extends StatelessWidget {
  const CircularProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
