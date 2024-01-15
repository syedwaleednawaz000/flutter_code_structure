import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_project/Presentation/Theme/app_style.dart';

// Provider class for managing the theme
class ThemeProvider with ChangeNotifier {
  // Dark theme configuration
  final darkTheme = ThemeData(
    // Theme properties for dark mode
  );

  // Light theme configuration
  final lightTheme = ThemeData(
    // Theme properties for light mode
  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  // Initialize the theme based on the saved preference during class instantiation
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

  bool? gettTheme() => _setTheme;

  // Retrieve the saved theme preference from SharedPreferences
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

  // Set the selected theme and persist the preference to SharedPreferences
  void setTheme({required bool themeValue}) async {
    _setTheme = themeValue;
    AppStyle.themValue = themeValue;
    if (themeValue == false) {
      _themeData = lightTheme;
      StorageManager.saveData('themeMode', themeValue);
      notifyListeners();
    } else {
      _themeData = darkTheme;
      StorageManager.saveData('themeMode', themeValue);
      notifyListeners();
    }
    // notifyListeners();
  }
}

// Class for managing storage using SharedPreferences
class StorageManager {
  static void saveData(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      // Handle other data types if needed
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
