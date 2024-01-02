import 'package:flutter/material.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/View/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_selector.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_app_bar.dart';
import 'package:simple_flutter_project/Presentation/Screens/Nav_bar_drawer/Component/custom_bottom_nav_bar.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_drawer.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/View/selectview.dart';



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
    const CounterScreen(),
    const HomeScreen(),
    const HomeAPIConsumer(),
    const HomeAPISelector(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      /// this is abid custom app bar
      appBar: customAppBar(
        appBarText: 'This is Counter Screen',
        leadingIcon: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),

      /// this is abid custom drawer widget
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _screens[_currentIndex],
    );
  }
}
