import 'package:flutter/material.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/selectview.dart';

class CustomBottonNavBar extends StatefulWidget {
  int currentIndex;
  final Function(int) onTap;

  CustomBottonNavBar({required this.currentIndex, required this.onTap});

  @override
  State<CustomBottonNavBar> createState() => _CustomBottonNavBarState();
}

class _CustomBottonNavBarState extends State<CustomBottonNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 18,
      selectedItemColor: Colors.blue,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.countertops),
          label: 'Counter',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.construction),
          label: 'Consumer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.select_all),
          label: 'Selector',
        ),
      ],
    );
  }
}
