import 'package:shared_preferences/shared_preferences.dart';

class SplashPrefs {
  static const currentScreen = "currentScreen";

  setScreen(String currentScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(currentScreen, currentScreen);
  }

  Future<String> getScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(currentScreen) ?? " ";
  }
}
