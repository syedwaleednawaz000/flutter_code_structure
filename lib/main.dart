import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Domain/counterprovider.dart';
import 'package:simple_flutter_project/Domain/userprovider.dart';
import 'Presentation/Screens/Main/selectview.dart';



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
