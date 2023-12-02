import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movietime/core/router/router.dart';

class SearchFromField extends StatelessWidget {
  const SearchFromField({super.key});
  
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      onFieldSubmitted: (value) {
      GoRouter.of(context).push(AppRouter.searchresults,
         extra: value,
      );
      },
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