import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/app_constant.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    // fontFamily: AppConstant.LightFont,
      primaryColor: const Color(0xffE1E1E1),
      cardColor: const Color(0xff000000),
      // Feild, Card
      backgroundColor: Color(0xff000000),
      scaffoldBackgroundColor: const Color(0xffffffff),
      // buttonColor: const Color(0xff434242),
      textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xffffffff))),
      shadowColor: Colors.black,
      // canvasColor: AppColors.primarybtn,
      // Button Color
      highlightColor: Colors.white,
      // Icons BG Color
      dialogBackgroundColor: Color(0xffD9D9D9),
      toggleableActiveColor: const Color(0xffD9D9D9),
      // accentColor: const Color(0xffD9D9D9),
      indicatorColor: const Color(0xffD9D9D9),
      dividerColor: Colors.white,
      hintColor: Colors.white,
      bottomAppBarColor: Colors.black);

  final lightTheme = ThemeData(
    // fontFamily: AppConstant.LightFont,
      primaryColor: const Color(0xff161A26),
      cardColor: const Color(0xffF2F2F2),
      //F2F2F2 Feild, Card
      backgroundColor: Color(0xffffffff),
      scaffoldBackgroundColor: const Color(0xff353535),
      // buttonColor: Color(0xff434242),
      textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xfffffff))),
      shadowColor: Colors.white,
      canvasColor: Colors.white,
      // Button Color, Drawar Icons Color
      // highlightColor: AppColors.primarybtn,
      // Icons BG Color
      dialogBackgroundColor: Color(0x54888888),
      toggleableActiveColor: const Color(0xff283349),
      hintColor: Colors.white,
      // accentColor: const Color(0xff283349),
      indicatorColor: const Color(0xff283349),
      dividerColor: Colors.white,
      bottomAppBarColor: Color(0xffffffff));

  ThemeData? _themeData;

  ThemeData? getTheme() => _themeData;
  //Todo my code
  ThemeNotifier() {
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

  bool? gettTheme() => _setTheme;

  Future<bool?> getStoreValue() async {
    final prefs = await SharedPreferences.getInstance();
    var themeBoolValue = prefs.getBool("themeValue");
    if (themeBoolValue == null) {
      // Set the default theme to darkTheme when themeValue is not found
      themeBoolValue = true;
      await prefs.setBool("themeValue", true);
    }
    AppConstant.themValue = themeBoolValue;
    notifyListeners();
    return themeBoolValue;
  }
  void setTheme({required bool themeValue}) async {
    _setTheme = themeValue;
    AppConstant.themValue = themeValue;
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
