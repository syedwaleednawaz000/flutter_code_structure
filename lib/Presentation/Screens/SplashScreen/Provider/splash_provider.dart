import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  static const currentScreen = "currentScreen";
  String? _currentScreen;

  SplashProvider() {
    /// Load theme status when ThemeProvider is created
    loadScreen();
  }

  get getCurrentScreen => _currentScreen;

  void setScreen(String currentScreen) {
    ///we don't accept other locales(languages without defined in all )
    _currentScreen = currentScreen;
    _setScreen(currentScreen);
    notifyListeners();
  }

  void clearLocale() {
    _currentScreen = null;
    notifyListeners();
  }

  loadScreen() async {
    _currentScreen = await _getScreen();
    notifyListeners();
  }



  void _setScreen(String currentScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(currentScreen, currentScreen);
  }

  Future<String> _getScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(currentScreen) ?? " ";
  }
}
