import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themeandlanguage/models/tab_info.dart';
import 'package:themeandlanguage/ui/screens/home_content.dart';
import 'package:themeandlanguage/ui/screens/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayout();
}
class _MainLayout extends State<MainLayout> {
  int selectedIndex = 0;
  List<TabInfo> tabs = [
    TabInfo(iconPath: Icons.home, content: HomeContent(), label: "Home"),
    TabInfo(iconPath: Icons.favorite, content: Container(), label: "Favorite"),
    TabInfo(iconPath: Icons.person, content: ProfileScreen(), label: "profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        body: SafeArea(child: tabs[selectedIndex].content),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff1643A5),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: tabs.map((tab) {
            return  BottomNavigationBarItem(
              icon: Icon(tab.iconPath),
              label: tab.label,
            );
          }).toList(),
        ),
      );
  }
}

