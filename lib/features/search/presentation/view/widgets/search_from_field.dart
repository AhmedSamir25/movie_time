import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movietime/core/router/router.dart';
import 'package:movietime/core/utils/style/color.dart';

class SearchFromField extends StatelessWidget {
  const SearchFromField({super.key});

  @override
  Widget build(BuildContext context) {
    late String valueSumbit;
    return TextFormField(
      onFieldSubmitted: (value) {
        valueSumbit = value;
        GoRouter.of(context).push(
          AppRouter.searchresults,
          extra: valueSumbit,
        );
      },
      onChanged: (value) {
        valueSumbit = value;
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
          icon: const Icon(Icons.search,color: textAppColor,),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: textAppColor),
        ),
      ),
    );
  }
}