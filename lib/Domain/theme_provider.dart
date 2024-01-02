import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_project/Presentation/Theme/app_style.dart';


class ThemeProvider with ChangeNotifier {
  final darkTheme = ThemeData(
      primaryColor: const Color(0xffE1E1E1),
      cardColor: const Color(0xff000000),

      scaffoldBackgroundColor: const Color(0xffffffff),
      // buttonColor: const Color(0xff434242),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Color(0xffffffff))),
      shadowColor: Colors.black,
      highlightColor: Colors.white,
      // Icons BG Color
      dialogBackgroundColor: const Color(0xffD9D9D9),

      indicatorColor: const Color(0xffD9D9D9),
      dividerColor: Colors.white,
      hintColor: Colors.white,);

  final lightTheme = ThemeData(
    // fontFamily: AppConstant.LightFont,
      primaryColor: const Color(0xff161A26),
      cardColor: const Color(0xffF2F2F2),
      scaffoldBackgroundColor: const Color(0xff353535),
      // buttonColor: Color(0xff434242),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Color(0x0fffffff))),
      shadowColor: Colors.white,
      canvasColor: Colors.white,
      // Icons BG Color
      dialogBackgroundColor: const Color(0x54888888),
      hintColor: Colors.white,
      // accentColor: const Color(0xff283349),
      indicatorColor: const Color(0xff283349),
      dividerColor: Colors.white,);
  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;
  //Todo my code
  ThemeProvider() {
    getStoreValue().then((themeBoolValue) {
      var themeMode = themeBoolValue ?? true; // Change the default to true (dark theme)
      if (themeMode == false) {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  bool? _setTheme;

  // bool? gettTheme() => _setTheme;

  Future<bool?> getStoreValue() async {
    final prefs = await SharedPreferences.getInstance();
    var themeBoolValue = prefs.getBool("themeValue");
    if (themeBoolValue == null) {
      // Set the default theme to darkTheme when themeValue is not found
      themeBoolValue = true;
      await prefs.setBool("themeValue", true);
    }
    AppStyle.themValue = themeBoolValue;
    notifyListeners();
    return themeBoolValue;
  }
  void setTheme({required bool themeValue}) async {
    _setTheme = themeValue;
    AppStyle.themValue = themeValue;
    notifyListeners();
    if (themeValue == false) {
      _themeData = lightTheme;
      StorageManager.saveData('themeMode', themeValue);
    } else {
      _themeData = darkTheme;
      StorageManager.saveData('themeMode', themeValue);
    }
  }

}


class StorageManager {
  static void saveData(String key,value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
    }
  }

  static Future<dynamic> readData(key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.getBool(key);
    return obj;
  }

  static Future<bool> deleteData(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}