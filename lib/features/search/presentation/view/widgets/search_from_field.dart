import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movietime/core/router/router.dart';

class SearchFromField extends StatelessWidget {
  const SearchFromField({super.key});

  @override
  Widget build(BuildContext context) {
    late String valueSumbit;
    return TextFormField(
      onChanged: (value) {
        valueSumbit = value;
        GoRouter.of(context).push(
          AppRouter.searchresults,
          extra: valueSumbit,
        );
      },
      decoration: InputDecoration(
        hintText: 'Search ?',
        suffixIcon: IconButton(
          onPressed: () {
            GoRouter.of(context).push(
              AppRouter.searchresults,
              extra: valueSumbit,
            );
          },
          icon: const Icon(Icons.search),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}