import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/Provider/counter_provider.dart';
import 'package:simple_flutter_project/l10n/Provider/localization_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/SplashScreen/Provider/splash_provider.dart';
import 'package:simple_flutter_project/Presentation/Theme/Provider/theme_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/Provider/user_provider.dart';
import 'package:simple_flutter_project/Presentation/routes/app_route_configs.dart';
import 'package:simple_flutter_project/l10n/support_languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  LocaleProvider localeProvider = LocaleProvider();
  await localeProvider.loadLocale();


  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        // final themeChangeProvider = Provider.of<ThemeNotifier>(context);
        final localeProvider = Provider.of<LocaleProvider>(context);
        return Consumer<ThemeNotifier>(builder: (context, value, child) {
          return ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              final themeProvider = Provider.of<ThemeNotifier>(context);
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Flutter code structure',
                theme: themeProvider.getTheme(),
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
        },);
      }),
    );
  }
}
