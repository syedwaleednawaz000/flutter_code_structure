import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_code_structure/Presentation/Screens/History/Provider/history_provider.dart';
import 'package:flutter_code_structure/Presentation/Screens/Home/Provider/home_provider.dart';
import 'package:flutter_code_structure/Presentation/Screens/SplashScreen/Provider/splash_provider.dart';
import 'package:flutter_code_structure/Presentation/Screens/NotificationHelper/notification_helper.dart';
import 'package:flutter_code_structure/Presentation/Theme/Provider/theme_provider.dart';
import 'Language/app_trans_delegat.dart';
import 'Language/language_provider.dart';
import 'Presentation/routes/app_route_configs.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final notificationHelper = NotificationHelper();
  await notificationHelper.initialize();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  // final String? locale;

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
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


