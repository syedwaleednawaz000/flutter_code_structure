import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_code_structure/Presentation/routes/app_route_configs.dart';
import 'package:flutter_code_structure/config/app_router_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppRouter.getLocalData();
    Timer(const Duration(seconds: 2), () {
      // context.go('${AppRouter.currentScreen}');
      context.go(AppRouteConstants.login);
    });
    return   Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:  SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome",style: TextStyle(color: Theme.of(context).cardColor),),
            Text("to",style: TextStyle(color: Theme.of(context).cardColor),),
            Text("code structure",style: TextStyle(color: Theme.of(context).cardColor),),
          ],
        ),
      ),
    );
  }
}
