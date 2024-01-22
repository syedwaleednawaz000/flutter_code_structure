import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/View/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_selector.dart';
import 'package:simple_flutter_project/Presentation/Screens/Nav_bar_drawer/View/navigation_drawer_main_screen.dart';
import 'package:simple_flutter_project/Presentation/Screens/profile/profile.dart';
import 'package:simple_flutter_project/config/app_router_constants.dart';


class AppRouter {
  static String currentScreen = '/';
  static GoRouter router = _buildRouter();

  static GoRouter _buildRouter() {
    return GoRouter(
      routes: [

        ///initial Route

        GoRoute(
          name: AppRouterConstants.selectScreen,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: NavigationDrawerMainScreen(),
            );
          },
        ),

        ///second route
        GoRoute(
          name: AppRouterConstants.counter,
          path: '/homeView',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: CounterScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouterConstants.navigationDrawerMainScreen,
          path: '/navigation_drawer_main_screen.dart',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: NavigationDrawerMainScreen(),
            );
          },
        ),

        ///third route
        GoRoute(
          name: AppRouterConstants.consumer,
          path: '/consumer',
          pageBuilder: (context, state) {
            // print("this is name ${state.name}");
            // saveLocalData(screenName: state.name);
            return const MaterialPage(
              child: HomeAPIConsumer(),
            );
          },
        ),

        ///forth route
        GoRoute(
          name: AppRouterConstants.selector,
          path: '/selector',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: HomeAPISelector(),
            );
          },
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        getLocalData();
        if (currentScreen != '/') {
          return '${currentScreen}';
        } else {
          return currentScreen;
        }
      },
    );
  }
  static Future<void> saveLocalData({String? screenName})async{
    SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    sharedPreferences.setString(AppRouterConstants.currentScreenName, screenName!);
    print("this is current sceen name ${screenName}");
  }
  static Future<void> getLocalData()async{
    SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    if(sharedPreferences.get(AppRouterConstants.currentScreenName) != null){
      currentScreen =     sharedPreferences.getString(AppRouterConstants.currentScreenName)!;
    }
  }
}