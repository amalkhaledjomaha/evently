import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final IconData icon;
      final String text;
  final bool selected;
  const Category({
    super.key,
    required this.icon,
  required this.text,
  this.selected =false,
});
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: const EdgeInsets.symmetric(horizontal: 12),
     decoration: BoxDecoration(
       color: selected ?Color(0xff1643A5): Colors.white,
       borderRadius: BorderRadius.circular(18),
       border: Border.all(
         color: Colors.grey
       ),
     ),
     child: Row(
       children: [
         Icon(icon,size: 16,color: selected ?Colors.white:Color(0xff1643A5),
         ),
         SizedBox(width: 5,),
         Text(text,
         style: TextStyle(
           fontSize: 11,
           color: selected? Colors.white:Colors.black
         ),
         ),
       ],
     ),
   );
  }
 
  
}