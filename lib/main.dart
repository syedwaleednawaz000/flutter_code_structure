import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/Provider/counter_provider.dart';
import 'package:simple_flutter_project/l10n/Provider/localization_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/SplashScreen/Provider/splash_provider.dart';
import 'package:simple_flutter_project/Presentation/Theme/Provider/theme_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/Provider/user_provider.dart';
import 'package:simple_flutter_project/Presentation/routes/app_route_configs.dart';
import 'package:simple_flutter_project/l10n/support_languages.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  // LocaleProvider localeProvider = LocaleProvider();
  // await localeProvider.loadLocale();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString('language_code') ?? "";
  print("********** $languageCode *************");

  runApp(
    MyApp(
      locale: languageCode,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? locale;

  MyApp({super.key, this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => LanguageChangeProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        // final themeChangeProvider = Provider.of<ThemeNotifier>(context);
        final languageProvider = Provider.of<LanguageChangeProvider>(context);
        return Consumer<ThemeNotifier>(
          builder: (context, value, child) {
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
                  locale: locale == ''
                      ? const Locale('en')
                      : Locale("$locale") ?? const Locale('en'),

                  ///localization aspects
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'),
                    Locale('ur'),
                  ],
                  routerConfig: MyAppRouter().router,

                  // routerConfigs:
                );
                // child: const SplashScreen()
              },
              // child: CounterScreen(),
            );
          },
        );
      }),
    );
  }
}
