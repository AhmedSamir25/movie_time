import 'package:flutter/material.dart';
import 'package:movietime/core/utils/color.dart';

class SearchFromField extends StatelessWidget {
  const SearchFromField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusColor: appColor,
        hintText: 'Search ?',
        suffixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16)
      )
      ),
      
    );
  }
}