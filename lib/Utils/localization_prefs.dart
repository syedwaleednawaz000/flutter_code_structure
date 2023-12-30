import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationPrefs {
  static const SELECTED_LANG = "SELECTEDLANGUAGE";

  setLanguage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SELECTED_LANG, locale.languageCode);
  }

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SELECTED_LANG) ?? " ";
  }
}
