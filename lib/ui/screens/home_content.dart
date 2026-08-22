import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themeandlanguage/ui/screens/event_details.dart';
import 'package:themeandlanguage/ui/widget/category.dart';
import 'package:themeandlanguage/ui/widget/eventcard.dart';
import 'package:themeandlanguage/utils/app_color.dart';


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
         StreamBuilder<QuerySnapshot>(
           stream: FirebaseFirestore.instance.collection('events').snapshots(),
           builder: (context,snapshot){
             if(snapshot.connectionState ==ConnectionState.waiting)
               {
                 return const Center(
                   child: CircularProgressIndicator(),
                 );
               }
             if (snapshot.hasError) {
               return Text(
                 'Error: ${snapshot.error}',
                 style: const TextStyle(color: Colors.red),
               );
             }
             if(! snapshot.hasData || snapshot.data!.docs.isEmpty){
               return const Text("no Events",style: TextStyle(color: AppColor.white),);
             }
             final events =snapshot.data!.docs;
             return Column(
               children: events.map((doc){
                 final data =doc.data() as Map<String,dynamic>;
                 final title =data['title'] ?? '';
                 final description =data['description'] ??'';
                 final category =data['category'] ??'';
                 final time =data['time'] ??'';
                 final image =data['image'] ??'';
                 String date = '';
                 if (data['date'] is Timestamp) {
                   final timestamp = data['date'] as Timestamp;
                   final eventDate = timestamp.toDate();

                   const months = [
                     'January',
                     'February',
                     'March',
                     'April',
                     'May',
                     'June',
                     'July',
                     'August',
                     'September',
                     'October',
                     'November',
                     'December',
                   ];

                   date = "${eventDate.day} ${months[eventDate.month - 1]}";
                 }
                 return Padding(padding: const EdgeInsets.only(bottom: 12),
                 child: InkWell(
                   onTap: (){
                     Navigator.push(context,
                         MaterialPageRoute(builder:(context) =>EventDetail(
                           title: title,
                           description: description,
                           date: date,
                           time: time,
                           cagegory: category,
                           image: image,
                             documentId:doc.id,
                         ),
                         ),
                     );
                   },
                   child: Eventcard
                     (date: date,
                       title: title, description: description, icon: Icons.favorite_border,image: image,
                   ),
                 ),
                 );

               }).toList(),
             );
           },
         ),
         const SizedBox(height: 12,),
        ]

     ),
   );
  }


}