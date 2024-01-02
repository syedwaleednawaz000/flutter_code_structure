import 'package:flutter/material.dart';
///first create this data , then datk theme preferences in services

class Styles  extends ChangeNotifier{
  ///static method to get the theming
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xffffffff),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: const Color(0xffE8FDFD),
        brightness: Brightness.light,
      ),
      cardColor: Colors.white,
      canvasColor: Colors.white,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.light(),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xff00001a),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: const Color(0xff1a1f3c),
        brightness: Brightness.dark,
      ),
      cardColor: Colors.black,
      canvasColor: Colors.black,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.dark(),
      ),
    );
  }

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? darkTheme(context) : lightTheme(context);
  }
}
