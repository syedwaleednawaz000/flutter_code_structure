import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Domain/theme_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/language_drop_down.dart';
import 'package:simple_flutter_project/Utils/app_router_constants.dart';
import 'package:simple_flutter_project/Utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../HomeNew/home_data_get_from_api_selector.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        backgroundColor: Colors.transparent,
        foregroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectLanguage,
                  style: TextStyle(
                      fontSize: 20, color: color, fontWeight: FontWeight.bold),
                ),
                LanguageDropDown(),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () => context.pushNamed(AppRouterConstants.counter),
              child: Text(
                AppLocalizations.of(context)!.counterText,
                style: TextStyle(color: color),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () => context.pushNamed(AppRouterConstants.consumer),
              child: Text(
                AppLocalizations.of(context)!.consumerText,
                style: TextStyle(color: color),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () => context.pushNamed(AppRouterConstants.selector),
              child: Text(
                AppLocalizations.of(context)!.selectorText,
                style: TextStyle(color: color),
              ),
            ),
            SwitchListTile(
              title: Text(
                themeProvider.getDarkTheme ? 'Dark' : 'Light',
                style: TextStyle(color: color),
              ),
              secondary: Icon(
                themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: color,
              ),
              onChanged: (bool value) {
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              },
              value: themeProvider.getDarkTheme,
            ),
          ],
        ),
      ),
    );
  }
}
