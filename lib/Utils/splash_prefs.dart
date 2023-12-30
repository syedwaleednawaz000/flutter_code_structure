import 'package:shared_preferences/shared_preferences.dart';

class SplashPrefs {
  static const CURRENT_SCREEN = "CURRENTSCREEN";

  setScreen(String currentScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CURRENT_SCREEN, currentScreen);
  }

  Future<String> getScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(CURRENT_SCREEN) ?? " ";
  }
}
