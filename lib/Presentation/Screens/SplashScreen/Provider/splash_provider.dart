import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Utils/splash_prefs.dart';

class SplashProvider with ChangeNotifier {
  /// this is the shared prefs class where i set and get data
  SplashPrefs splashPrefs = SplashPrefs();
  String? _currentScreen;

  SplashProvider() {
    /// Load theme status when ThemeProvider is created
    loadScreen();
  }

  get getCurrentScreen => _currentScreen;

  void setScreen(String crntScreen) {
    ///we don't accept other locales(languages without defined in all )
    _currentScreen = crntScreen;
    splashPrefs.setScreen(crntScreen);
    notifyListeners();
  }

  void clearLocale() {
    _currentScreen = null;
    notifyListeners();
  }

  loadScreen() async {
    _currentScreen = await splashPrefs.getScreen();
    notifyListeners();
  }
}
