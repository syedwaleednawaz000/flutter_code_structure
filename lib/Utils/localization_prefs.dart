// import 'package:flutter/widgets.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LocalizationPrefs {
//   static const selectLanguage = "selectLanguage";
//
//   setLanguage(Locale locale) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(selectLanguage, locale.languageCode);
//   }
//
//   Future<String> getLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(selectLanguage) ?? " ";
//   }
// }
