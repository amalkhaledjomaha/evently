import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themeandlanguage/ui/screens/editevent.dart';
import 'package:themeandlanguage/utils/app_color.dart';

class EventDetail extends StatelessWidget{
  final String title;
  final String description;
  final String date;
  final String time;
  final String image;
  final String cagegory;
  const EventDetail({
    super.key,
  required this.title,
  required this.description,
    required this.date,
    required this.time,
  required this.cagegory,
  required this.image,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e7ee),
      appBar: AppBar(
        backgroundColor: Color(0xffe6e7ee),
        centerTitle: true,
        title: Text("Event details",style: TextStyle(color: AppColor.black,fontSize: 16,fontWeight: FontWeight.w600),),
        leading: Padding(padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(padding:EdgeInsets.zero,
              onPressed: (){
            Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                color: AppColor.primaray,
              ),
          ),
        ),) ,
        actions: [
          Padding(padding: const EdgeInsets.only(right: 8),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(onPressed: () async{
              final  result =await Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Editevent(
                date:date,
                title:title,
                description:description,
                image :image,
                time: time,
                cagegory: cagegory,
              ),),);
              if( result != null)
                {

                }
            },
                icon: const Icon(Icons.edit_outlined,size: 20,
                  color:AppColor.primaray,)),
          ),),
          Padding(padding: const EdgeInsets.only(right: 12),
              child:Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(onPressed: (){},
                    icon: const Icon(Icons.delete_outline, size: 20,color: AppColor.errorlight,
                    ),),
              ),)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Container(
            width: double.infinity,
            height: 117,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: image.isNotEmpty ?Image.asset(image,fit:BoxFit.cover,height:193 ,)
                :Center(
              child:
              Text(title,style: const TextStyle(color: AppColor.primaray,fontSize: 48,fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text("We're going to play football",style:  const TextStyle(color: AppColor.black,fontSize: 13,fontWeight: FontWeight.w600,),),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,vertical: 11,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(width: 34,height: 34,decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.calendar_month_outlined,size: 18,
                  color: AppColor.primaray,),),
                  const SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(date,style: TextStyle(
                        fontSize: 10,
                        color: AppColor.grey
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Text("Description",
              style:TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(description,
              style: const TextStyle(
                fontSize: 11,
                height: 1.45,
                color: AppColor.black,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}