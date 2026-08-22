import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themeandlanguage/utils/app_color.dart';

class Eventcard extends StatelessWidget {
  final String date;
   final   String title;
 final String description;
  final IconData icon;
  final String image;
  const Eventcard({super.key,

  required this.date,
  required this.title,
  required this.description,
  required this.icon,
  required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
     height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
      height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(image,fit: BoxFit.cover,),
    ),


          const SizedBox(height: 2,),

          const Spacer(),
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Color(0xffF8F9FC),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey
              ),
            ),
            child: Row(
              children: [
                Expanded(child: Text(title,style: const TextStyle(fontSize: 14),),),
               Icon(icon,size: 18,color: const Color(0xff1643A5),),
              ],
            ),
          )
        ],
      ),
    );
  }


}