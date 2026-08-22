import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themeandlanguage/utils/app_color.dart';

class Editevent  extends StatefulWidget{
  final String title;
  final String description;
  final String date;
  final String time;
  final String image;
  final String cagegory;
  const Editevent({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.cagegory,
    required this.image,
  });  @override
  State<Editevent> createState()=> _EditEventState();
}
class  _EditEventState extends State<Editevent> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late String selectedCategory;
  late String selectedDate;
  late String selectedTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    selectedDate = widget.date;
    selectedTime = widget.time;
    selectedCategory = widget.cagegory;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }


Future<void> selectDate() async {
DateTime initialDate = DateTime.now();

try {
initialDate = DateFormat(
'MMM d, yyyy',
).parse(selectedDate);
} catch (_) {
initialDate = DateTime.now();
}

final DateTime? pickedDate = await showDatePicker(
context: context,
initialDate: initialDate,
firstDate: DateTime(2020),
lastDate: DateTime(2100),
);

if (pickedDate != null) {
setState(() {
selectedDate = DateFormat(
'MMM d, yyyy',
).format(pickedDate);
});
}
}

Future<void> selectTime() async {
TimeOfDay initialTime = TimeOfDay.now();

try {
final parsedTime = DateFormat(
'h:mm a',
).parse(selectedTime);

initialTime = TimeOfDay(
hour: parsedTime.hour,
minute: parsedTime.minute,
);
} catch (_) {
initialTime = TimeOfDay.now();
}

final TimeOfDay? pickedTime = await showTimePicker(
context: context,
initialTime: initialTime,
);

if (pickedTime != null) {
setState(() {
selectedTime = pickedTime.format(context);
});
}
}
@override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xffe6e7ee),
    appBar: AppBar(
      backgroundColor: Color(0xffe6e7ee),
      centerTitle: true,
      title: Text("Edit Event", style:
      TextStyle(
          color: AppColor.black, fontSize: 16, fontWeight: FontWeight.w600),),
      leading: Padding(padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: AppColor.primaray,
            ),
          ),
        ),),

    ),
    bottomNavigationBar: SafeArea(child: Container(color:
    const Color(0xffe6e7ee),
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: SizedBox(width: double.infinity,
        height: 50,
        child: ElevatedButton(onPressed: () {
          Navigator.pop
            (context, {
            'title': titleController.text,
            'description': descriptionController.text,
            'date': selectedDate,
            'time': selectedTime,
            'category': selectedCategory,
            'image': widget.image,
          });
        },

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaray,
            foregroundColor: AppColor.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text("Update event",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600
            ),
          ),
        ),),
    ),),
    body: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: widget.image.isNotEmpty ?
            Image.asset(widget.image, fit: BoxFit.cover, height: 193,)
                : Center(
              child:
              Text(widget.title, style: const TextStyle(
                  color: AppColor.primaray,
                  fontSize: 48,
                  fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const SizedBox(height: 10),
          SizedBox(height: 35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _categoryItem(
                  "Book club",
                  Icons.menu_book,
                ), const SizedBox(width: 6,),

                _categoryItem(
                  "Sport",
                  Icons.sports_score_sharp,
                ), const SizedBox(width: 6,),
                _categoryItem(
                  "Birthday",
                  Icons.cake_outlined,
                ),
              ],
            ),),

           Text("Title",style:  const TextStyle(color: AppColor.black,fontSize: 13,fontWeight: FontWeight.w600,),),

          TextField(
            controller: titleController,
            style: TextStyle(fontSize: 10),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),

          const SizedBox(height: 10),
          const Text("Description",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
          const SizedBox(height: 8),
          TextField(
            controller: descriptionController,
            style: TextStyle(fontSize: 10),
            maxLines: 5,

            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: selectDate,
            child: _infoRow(
              icon: Icons.calendar_month_outlined,
              title: "Event Date",
              value: selectedDate,
            ),
          ),
          const SizedBox(height: 8),

          GestureDetector(
            onTap: selectTime,
            child: _infoRow(
              icon: Icons.access_time,
              title: "Event Time",
              value: selectedTime,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    ),
  );
}

Widget  _categoryItem(
String category,
IconData icon,){
      final bool selected =selectedCategory ==category;
      return GestureDetector(
onTap: (){
  setState(()
{
selectedCategory =category;
});
},
child: Container(
padding: EdgeInsets.symmetric(
horizontal: 10
),
decoration: BoxDecoration(
color: selected ?AppColor.primaray :AppColor.white,
borderRadius: BorderRadius.circular(9),
),
child: Row(
children: [
  Icon(icon,size: 14,color: selected? AppColor.white :AppColor.black,),
const SizedBox(width: 5),
Text(
category,
style: TextStyle(
fontSize: 10,
color: selected
? Colors.white
    : AppColor.black,
fontWeight: FontWeight.w500,
),
),


],
),
),
);
}

Widget  _infoRow({
required IconData icon,
required String title,
required String value,
}){
return Row(
children: [
  Container(
width: 28,
height: 28,
decoration: BoxDecoration(
color: Colors.transparent,
borderRadius: BorderRadius.circular(7),
),
child: Icon(icon,size: 17,color:AppColor.primaray,),
),
const SizedBox(width: 8),

Text(title,style: TextStyle(fontSize: 11,color: AppColor.black,fontWeight: FontWeight.w500),),
const Spacer(),
Text(value,style: TextStyle(fontSize: 10,color: AppColor.primaray,fontWeight: FontWeight.w500),),

],
);
}


  }

