import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Provider/counterprovider.dart';
import 'Provider/userprovider.dart';
import 'View/Home/homeview.dart';
import 'View/HomeNew/home_data_get_from_api_consumer.dart';
import 'View/HomeNew/home_data_get_from_api_selector.dart';
import 'View/Main/selectview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter code structure',
              home: child,
            );
            // child: const SplashScreen()
          },
          child:  CounterScreen(),
        );
      }),
    );
  }
}
