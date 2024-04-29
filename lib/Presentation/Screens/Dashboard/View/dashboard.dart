import 'package:flutter/material.dart';
import 'package:flutter_code_structure/Presentation/Screens/Chat/View/inbox_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/History/View/history_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/Home/View/home_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/profile/View/profile_screen.dart';

import '../components/custom_bottom_nav_bar.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState
    extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  final List<dynamic> _screens = [
     HomeScreen(screenName: "Home"),
     HistoryScreen(screenName: "History"),
     InboxScreen(),
      ProfileScreen(screenName: "ProfileScreen",)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// this is abid custom drawer widget
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            print("this is waleed ${index.toString()}");
            _currentIndex = index;
          });
        },
      ),
      body: _screens[_currentIndex],
    );
  }
}
