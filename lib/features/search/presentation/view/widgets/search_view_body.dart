import 'package:flutter/material.dart';
import 'package:movietime/features/search/presentation/view/widgets/search_from_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: 
          SizedBox(
          child:  SearchFromField(
          ),
        
      ),
    );
  }
}