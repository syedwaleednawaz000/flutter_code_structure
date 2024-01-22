import 'package:flutter/material.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/View/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_selector.dart';
import 'package:simple_flutter_project/Presentation/Screens/Nav_bar_drawer/Component/custom_bottom_nav_bar.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_drawer.dart';
import 'package:simple_flutter_project/Presentation/Screens/profile/profile.dart';


class NavigationDrawerMainScreen extends StatefulWidget {
  const NavigationDrawerMainScreen({super.key});

  @override
  State<NavigationDrawerMainScreen> createState() =>
      _NavigationDrawerMainScreenState();
}

class _NavigationDrawerMainScreenState
    extends State<NavigationDrawerMainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  final List<dynamic> _screens = [
     CounterScreen(screenName: "CounterScreen"),
     HomeAPIConsumer(screenName: "HomeAPIConsumer"),
     HomeAPISelector(screenName: "HomeAPISelector"),
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
