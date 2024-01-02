import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const themeStatus = "themeStatus";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
          themeStatus,
        ) ??
        false;

    /// this ?? false is for initial value which is light , if we make it true initial theme will be dark
  }
}
