import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themeandlanguage/ui/screens/event_details.dart';
import 'package:themeandlanguage/ui/widget/category.dart';
import 'package:themeandlanguage/ui/widget/eventcard.dart';

class HomeContent extends StatelessWidget{
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     padding: const EdgeInsets.symmetric(horizontal: 16),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const SizedBox(height: 15,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Welcome Back ✨",style: TextStyle(fontSize: 11,color: Colors.grey),),
                 Text("John Safwat",style: TextStyle(fontSize: 16,color: Colors.white),),
               ],
             ),
             Row(
               children: [
                 Icon(Icons.wb_sunny_outlined,size: 20,color: Color(0xff1643A5),),
                 const SizedBox(width: 10,),
                 Container(
                   padding: const EdgeInsets.symmetric(
                     horizontal: 9,
                     vertical: 7,
                   ),
                   decoration: BoxDecoration(
                     color: Color(0xff1643A5),
                     borderRadius: BorderRadius.circular(7),
                   ),
                   child: Text("EN",style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold),),
                 ),
               ],
             ),
           ],
         ),
         const SizedBox(height: 20,),
         SizedBox(
           height: 38,
           child: ListView(
             scrollDirection: Axis.horizontal,
             children: [
               Category(
                 icon:Icons.grid_view,
                 text:"All",
                 selected:true,
               ),
               SizedBox(width: 8),
               Category(
                 icon:Icons.grid_view,
                 text:"Sport",
               ),
               SizedBox(width: 8),

               Category(
                 icon:Icons.grid_view,
                 text:"Birthday",
               ),
             ],
           ),
         ),
         SizedBox(height: 12),
         InkWell(
           onTap: (){
             Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>EventDetail(
                 title: "Meeting",
                 description: "Meeting for Updating Develpment Method",
                 date: "22jan",
                 time: "12:00",
                 cagegory: "sport",
                 image: "image"
             ),
             ),
           );
         },
         child: Eventcard(
           date:"22jan",
             title:"Meeting",
             description :"Meeting for Updating Develpment Method",
           icon:Icons.favorite_border,
         ),
  ),
         const SizedBox(height: 12,),
        ]

     ),
   );
  }


}