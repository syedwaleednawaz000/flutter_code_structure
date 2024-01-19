import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:simple_flutter_project/Presentation/Screens/Home/View/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_selector.dart';
import 'package:simple_flutter_project/Presentation/Screens/Nav_bar_drawer/View/navigation_drawer_main_screen.dart';
import 'package:simple_flutter_project/config/app_router_constants.dart';


class MyAppRouter {
  GoRouter router = GoRouter(
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
  );
}
