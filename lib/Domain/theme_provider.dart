import 'package:flutter/material.dart';

import '../Presentation/Theme/dark_theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreferences darkThemePreferences = ThemePreferences();
  bool _darkTheme = false;

  ThemeProvider() {
    // Load theme status when ThemeProvider is created
    loadTheme();
  }

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }

  void loadTheme() async {
    _darkTheme = await darkThemePreferences.getTheme();
    notifyListeners();
  }
}
