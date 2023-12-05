import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movietime/core/utils/style/text_style.dart';
import 'package:movietime/features/home_detils/presentation/view/widgets/iconand_text_actor.dart';

class InformatiomActor extends StatelessWidget {
  const InformatiomActor({super.key, required this.birthday, this.deathday, required this.placeOfBirth, required this.biography});
  final String? birthday;
  final String? deathday;
  final String? placeOfBirth;
  final String? biography;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Column(
        children: [
          Row(
          children:[ 
          IconAndTextActor(icon:Icons.calendar_month ,text: birthday??'',),
          SizedBox(width: 7.w,),
            IconAndTextActor(text: deathday??''),
            ],
          ),
          SizedBox(height: 7.h,),
          IconAndTextActor(icon: Icons.home,text: placeOfBirth??'',),
          SizedBox(height: 7.h,),
          const IconAndTextActor(text: 'Biography:',icon: Icons.person,),
          SizedBox(height: 5.h,),
          Container(
            constraints:  BoxConstraints(maxWidth: 420.w),
            child: Text(biography??'',style: StyleText.textStyle13.copyWith(color: Colors.white),)),
        ],
      ),
    );
  }
}