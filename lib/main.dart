import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Domain/counterprovider.dart';
import 'package:simple_flutter_project/Domain/localization_provider.dart';
import 'package:simple_flutter_project/Domain/splash_provider.dart';
import 'package:simple_flutter_project/Domain/theme_provider.dart';
import 'package:simple_flutter_project/Domain/userprovider.dart';
import 'package:simple_flutter_project/Presentation/routes/app_route_configs.dart';
import 'package:simple_flutter_project/l10n/support_languages.dart';
import 'Presentation/Screens/Main/selectview.dart';
import 'Presentation/Theme/theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  LocaleProvider localeProvider = LocaleProvider();
  SplashProvider splashProvider = SplashProvider();
  await localeProvider.loadLocale();
  await splashProvider.loadScreen();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChangeProvider = Provider.of<ThemeProvider>(context);
        final localeProvider = Provider.of<LocaleProvider>(context);
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Flutter code structure',
              theme:
                  Styles.themeData(themeChangeProvider.getDarkTheme, context),
              locale: localeProvider.locale,

              ///localization aspects
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: SupportLanguages.languages,
              routerConfig: MyAppRouter().router,

              // routerConfigs:
            );
            // child: const SplashScreen()
          },
          // child: CounterScreen(),
        );
      }),
    );
  }
}
