import 'package:flutter/material.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/View/selectview.dart';

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
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 18,
      selectedItemColor: Colors.blue,
      items: const [
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
