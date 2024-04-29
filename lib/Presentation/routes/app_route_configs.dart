import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_code_structure/Presentation/Screens/Auth/Forgot/View/forgot_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/Auth/LogIn/View/login_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/Auth/Registraion/View/registration_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/Dashboard/View/dashboard.dart';
import 'package:flutter_code_structure/Presentation/Screens/History/View/history_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/Home/View/home_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/SplashScreen/View/splash_screen.dart';
import 'package:flutter_code_structure/Presentation/Screens/profile/View/profile_screen.dart';
import 'package:flutter_code_structure/config/app_router_constants.dart';

class AppRouter {
  static String currentScreen = '/';
  static GoRouter router = _buildRouter();

  static GoRouter _buildRouter() {
    return GoRouter(
      initialLocation: '/',
      errorPageBuilder: (context, state) => const MaterialPage(child: Scaffold(body: Center(child: Text('Page Not Found')))),
      routes: [
        GoRoute(
          name: AppRouteConstants.splashScreen,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SplashScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.homeView,
          path: AppRouteConstants.homeView,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return  MaterialPage(
              child: HomeScreen(
                screenName: "Home",
              ),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.dashBoardScreen,
          path: AppRouteConstants.dashBoardScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: DashBoardScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.historyScreen,
          path: AppRouteConstants.historyScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return  MaterialPage(
              child: HistoryScreen(
                screenName: "History",
              ),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.login,
          path: AppRouteConstants.login,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: LoginScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.registration,
          path: AppRouteConstants.registration,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: RegistrationScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.forgot,
          path: AppRouteConstants.forgot,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: ForgotPasswordScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.profileScreen,
          path: AppRouteConstants.profileScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return  MaterialPage(
              child: ProfileScreen(
                screenName: "ProfileScreen",
              ),
            );
          },
        ),
      ],
    );
  }

  static Future<void> saveLocalData({required String screenName}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove(AppRouteConstants.currentScreenName);
      sharedPreferences.setString(AppRouteConstants.currentScreenName, screenName);
    } catch (e) {
      if (kDebugMode) {
        print("Error saving local data: $e");
      }
    }
  }

  static Future<void> getLocalData() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if (sharedPreferences.getString(AppRouteConstants.currentScreenName) != null) {
        currentScreen = sharedPreferences.getString(AppRouteConstants.currentScreenName)!;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting local data: $e");
      }
    }
  }
}
