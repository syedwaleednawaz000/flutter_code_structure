import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_flutter_project/Presentation/Nav_bar_drawer/navigation_drawer_main_screen.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/home_data_get_from_api_selector.dart';
import 'package:simple_flutter_project/Utils/app_router_constants.dart';

import '../Screens/Main/selectview.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      ///initial Route

      GoRoute(
        name: AppRouterConstants.selectScreen,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: CounterScreen(),
          );
        },
      ),

      ///second route
      GoRoute(
        name: AppRouterConstants.counter,
        path: '/homeview',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: HomeScreen(),
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

// class MyAppRouter {
//   GoRouter router = GoRouter(
//       routes: [
//         ///first route
//         GoRoute(
//           // name: 'page_one',
//           name: AppRouteConstants.homeScreen,
//
//           ///this is initial route
//           path: '/',
//           pageBuilder: (context, state) {
//             return MaterialPage(
//               child: HomeScreen(),
//             );
//           },
//         ),
//
//         ///second route
//         GoRoute(
//           // name: 'page_one',
//           name: AppRouteConstants.pageOne,
//
//           ///this is initial route
//           path: '/page_one',
//           pageBuilder: (context, state) {
//             return MaterialPage(
//               child: PageOne(),
//             );
//           },
//         ),
//
//         /// second route
//         GoRoute(
//           name: AppRouteConstants.pageTwo,
//           path: '/page_two',
//           pageBuilder: (context, state) {
//             return MaterialPage(
//               child: PageTwo(),
//             );
//           },
//         ),
//
//         /// third route
//         GoRoute(
//           name: AppRouteConstants.pageThree,
//           path: '/page_three',
//           pageBuilder: (context, state) {
//             return MaterialPage(
//               child: PageThree(),
//             );
//           },
//         ),
//
//         ///forth route
//         GoRoute(
//           name: AppRouteConstants.pageFour,
//           path: '/page_four',
//           pageBuilder: (context, state) {
//             return MaterialPage(
//               child: PageFour(),
//             );
//           },
//         ),
//       ],
//       errorPageBuilder: (context, state) {
//         return MaterialPage(
//           child: ErrorPage(),
//         );
//       });
// }
