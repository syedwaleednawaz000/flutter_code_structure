import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/Provider/counter_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/Provider/user_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/SplashScreen/Provider/splash_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/api/firebase_api.dart';
import 'package:simple_flutter_project/Presentation/Theme/Provider/theme_provider.dart';
import 'Language/app_trans_delegat.dart';
import 'Language/language_provider.dart';
import 'Presentation/routes/app_route_configs.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await FireBaseApi().initNotification();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // final String? locale;

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final languageProvider = Provider.of<LanguageProvider>(context);
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            themeProvider.initializeTheme();
            // languageProvider.loadLocalLanguageCode();
            return ScreenUtilInit(
              designSize: const Size(393, 852),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                final themeProvider = Provider.of<ThemeProvider>(context);
                return MaterialApp.router(
                  routeInformationProvider: AppRouter.router.routeInformationProvider,
                  routeInformationParser: AppRouter.router.routeInformationParser,
                  routerDelegate: AppRouter.router.routerDelegate,
                  // navigatorKey: navigatorKey,
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter code structure',
                  theme: themeProvider.getTheme(),
                  locale: languageProvider.selectedLanguage,
                  supportedLocales: languageProvider.supportedLanguages,
                  localizationsDelegates: [
                    AppTranslationsDelegate(languageProvider.selectedLanguage),
                    ...GlobalMaterialLocalizations.delegates,
                    GlobalWidgetsLocalizations.delegate,
                  ],

                  // home: const NavigationDrawerMainScreen(),
                );
              },
            );
          },
        );
      }),
    );
  }
}


