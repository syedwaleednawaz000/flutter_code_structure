import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_flutter_project/Presentation/routes/app_route_configs.dart';
import 'package:simple_flutter_project/config/app_router_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppRouter.getLocalData();
    Timer(const Duration(seconds: 2), () {
      // context.go('${AppRouter.currentScreen}');
      context.go(AppRouteConstants.navigationDrawerMainScreen);
    });
    return  const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome",style: TextStyle(color: Colors.black),),
            Text("to",style: TextStyle(color: Colors.black),),
            Text("structure",style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
