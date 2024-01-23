import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/View/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_selector.dart';
import 'package:simple_flutter_project/Presentation/Screens/Nav_bar_drawer/View/navigation_drawer_main_screen.dart';
import 'package:simple_flutter_project/Presentation/Screens/SplashScreen/View/splash_screen.dart';
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
          name: AppRouteConstants.splashScreen,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SplashScreen(),
            );
          },
        ),

        ///second route
        GoRoute(
          name: AppRouteConstants.homeView,
          path: AppRouteConstants.homeView,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name);
            return  MaterialPage(
              child: CounterScreen(
                screenName: "CounterScreen",
              ),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.navigationDrawerMainScreen,
          path: AppRouteConstants.navigationDrawerMainScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name);
            return const MaterialPage(
              child: NavigationDrawerMainScreen(),
            );
          },
        ),

        ///third route
        GoRoute(
          name: AppRouteConstants.homeConsumer,
          path: AppRouteConstants.homeConsumer,
          pageBuilder: (context, state) {
            print("this is name ${state.name}");
            saveLocalData(screenName: state.name);
            return  MaterialPage(
              child: HomeAPIConsumer(
                screenName: "HomeAPIConsumer",
              ),
            );
          },
        ),

        ///forth route
        GoRoute(
          name: AppRouteConstants.homeSelector,
          path: AppRouteConstants.homeSelector,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name);
            return  MaterialPage(
              child: HomeAPISelector(
                screenName: "HomeAPISelector",
              ),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.profileScreen,
          path: AppRouteConstants.profileScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name);
            return  MaterialPage(
              child: ProfileScreen(
                screenName: "ProfileScreen",
              ),
            );
          },
        ),
      ],
      // redirect: (BuildContext context, GoRouterState state) {
      //   // getLocalData();
      //   print("this direct url ${state.name}");
      //   if (currentScreen != '') {
      //     print("this is current screeen");
      //     return '${currentScreen}';
      //   } else {
      //     print("this is current screeen error ${currentScreen} ");
      //     print("this is current screeen error ${AppRouterConstants.navigationDrawerMainScreen} ");
      //     return AppRouterConstants.navigationDrawerMainScreen;
      //   }
      // },
    );
  }
  static Future<void> saveLocalData({String? screenName}) async {
    print("this is current screen name ${screenName}");
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove(AppRouteConstants.currentScreenName);
      sharedPreferences.setString(AppRouteConstants.currentScreenName, screenName!);
      print("this is screen name $screenName");
      print("this is current screen name ${sharedPreferences.getString(AppRouteConstants.currentScreenName)}");
    } catch (e) {
      print("Error saving local data: $e");
    }
  }
  //
  static Future<void> getLocalData() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if (sharedPreferences.getString(AppRouteConstants.currentScreenName) != null) {
        print("this is not equal to $currentScreen");
        currentScreen = sharedPreferences.getString(AppRouteConstants.currentScreenName)!;
        print("this is not equal to $currentScreen");
      }
    } catch (e) {
      print("Error getting local data: $e");
    }
  }
}