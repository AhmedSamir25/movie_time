import 'package:flutter/material.dart';


class SearchFromField extends StatelessWidget {
  const SearchFromField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.white,
        hintText: 'Search ?',
        suffixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      fillColor: Colors.white,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      ),
      
    );
  }
}