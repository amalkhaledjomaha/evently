import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Eventcard extends StatelessWidget {
  final String date;
   final   String title;
 final String description;
  final IconData icon;
  const Eventcard({super.key,

  required this.date,
  required this.title,
  required this.description,
  required this.icon,});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
     height: 145,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Container(
          padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xffF0F5FF),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            date,
            style:  TextStyle(
              fontSize: 10,
              color :Color(0xff1643A5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
          const SizedBox(height: 2,),
          Text(
            title,
            style:  TextStyle(
              fontSize: 40,
              height: 1,
              color :Color(0xff1643A5),
            ),
          ),
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
                Expanded(child: Text(description,maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 9),),),
               Icon(icon,size: 18,color: const Color(0xff1643A5),),
              ],
            ),
          )
        ],
      ),
    );
  }


}