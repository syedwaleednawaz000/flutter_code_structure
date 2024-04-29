import 'package:flutter/material.dart';
import 'package:flutter_code_structure/Language/app_translation.dart';

import 'package:flutter_code_structure/my_size/my_size.dart';

class CustomBottomNavBar extends StatefulWidget {
  int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle:  TextStyle(
        fontSize: MySize.size14,
        color: Colors.black
      ),
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: MySize.size18,
      selectedItemColor: Colors.blue,
      items:  [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),

        const BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),
        const BottomNavigationBarItem(
          icon:  Icon(Icons.chat),
          label:  "Chat",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label:  AppTranslations.of(context).profile,
        ),
      ],
    );
  }
}
