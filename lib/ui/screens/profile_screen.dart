import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themeandlanguage/provider/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        toolbarHeight: 150,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfilePicture(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(

                    "John Sawfat",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "johnsawfat.route@gmail.com",
                    maxLines: 2,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SettingWidget(
              label: "Language",onTap:(){},),
            SizedBox(height: 20),
            SettingWidget(
              label: "Theme",onTap:(){
                context.read<ThemeProvider>().toggleTheme();
            },),
          ],
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: Image.asset(
          "assets/images/profile.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SettingWidget extends StatelessWidget {
  final String label;
  final Function()? onTap;


  const SettingWidget({
    super.key,
    required this.label,this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: (){
              onTap!();

            },

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color:  Color(0xff5669FF),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [

                  const Spacer(),
                   Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xff5669FF),
                    size: 28,
                  )
                ],
              ),
            ),

          ),

        ],

    );
  }
}


// showModalBottomSheet(
// context: context,
// constraints :BoxConstraints(
// maxHeight: MediaQuery.sizeOf(context).height * 0.4,
// ),
// builder: (context) {
// final List<String> options;
// if(label =="Language")
// {
// options =["Arabic","English",];
// }else {
// options =["Light","Dark",];
//
// }
// return Padding(
// padding: const EdgeInsets.all(16),
// child: Column(
//
// children: [
// ...options.map(
// (option){
// return   ListTile(
// title:Text(option,
// style: TextStyle(fontSize: 20,
// fontWeight: .w400),),
// trailing: Icon(Icons.check,color: Color(0xff5669FF),
// ),
// onTap: (){
// Navigator.pop(context);
// },
// );
//
// }
// )
//
// ],
// ),
// );
// }
// );