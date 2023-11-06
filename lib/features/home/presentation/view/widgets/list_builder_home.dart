import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/features/home/presentation/view/widgets/image_list.dart';



class ListBuilderHome extends StatelessWidget {
  const ListBuilderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemBuilder: (context, index) =>  Padding(
        padding: const  EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
           const ImageList(
          ),
          Positioned(
            top: 138.h,
            left: 13.w,
            //TODO font Style & color 
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.blue,
              ),
            ),
          ),
          ],
        )  
      ),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
    );
  }
}