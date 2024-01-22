import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/Provider/counter_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/View/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/Provider/user_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/SplashScreen/Provider/splash_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/api/firebase_api.dart';
import 'package:simple_flutter_project/Presentation/Theme/Provider/theme_provider.dart';
import 'package:simple_flutter_project/config/app_constant.dart';
import 'package:simple_flutter_project/config/app_router_constants.dart';
import 'package:simple_flutter_project/l10n/Provider/localization_provider.dart';
import 'Presentation/Screens/HomeNew/View/home_data_get_from_api_consumer.dart';
import 'Presentation/Screens/HomeNew/View/home_data_get_from_api_selector.dart';
import 'Presentation/Screens/Nav_bar_drawer/View/navigation_drawer_main_screen.dart';

import 'Presentation/routes/app_route_configs.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await FireBaseApi().initNotification();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageChangeProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final languageProvider = Provider.of<LanguageChangeProvider>(context);

          return Consumer<ThemeProvider>(
            builder: (context, value, child) {
              languageProvider.loadLocalLanguageCode();
              return ScreenUtilInit(
                designSize: const Size(393, 852),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  final themeProvider = Provider.of<ThemeProvider>(context);
                  final router = MyAppRouter().router;
                  return MaterialApp.router(
                    // navigatorKey: navigatorKey,
                    routerConfig: router,
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter code structure',
                    theme: themeProvider.getTheme(),
                    locale: languageProvider.appLocale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('en'), // English
                      Locale('ur'),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
