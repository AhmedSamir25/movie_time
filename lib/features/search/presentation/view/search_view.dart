import 'package:flutter/material.dart';
import 'package:movietime/core/utils/color.dart';
import 'package:movietime/features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'),
      backgroundColor: appColor,
      ),
      body: const SearchViewBody(),
    );
  }
}
