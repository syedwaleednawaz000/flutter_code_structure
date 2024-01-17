// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../support_languages.dart';
//
// class LocaleProvider with ChangeNotifier {
//   // Key for storing selected language in shared preferences
//   String selectLanguage = "selectLanguage";
//
//   // Current selected language
//   String currentLanguage = "";
//
//   // Internal representation of the selected locale
//   Locale? _locale;
//   Locale? get locale => _locale;
//
//   // Constructor that loads the saved locale during initialization
//   LocaleProvider() {
//     loadLocale();
//   }
//
//   // Set the current locale and persist it to shared preferences
//   void setLocale(Locale locale) {
//     // Ensure the provided locale is in the list of supported languages
//     if (!SupportLanguages.languages.contains(locale)) return;
//
//     // Set the internal locale
//     _locale = locale;
//
//     // Persist the language setting
//     _setLanguage(locale);
//
//     // Notify listeners of the change
//     notifyListeners();
//   }
//
//   // Clear the current locale
//   void clearLocale() {
//     // Clear the internal locale
//     _locale = null;
//
//     // Notify listeners of the change
//     notifyListeners();
//   }
//
//   // Load the saved locale from shared preferences
//   Future<void> loadLocale() async {
//     // Retrieve the saved language from shared preferences
//     String savedLanguage = await _getLanguage();
//
//     // Initialize the internal locale with the retrieved language
//     _locale = Locale(savedLanguage);
//
//     // Print the saved language to the console in debug mode
//     if (kDebugMode) {
//       print("this is locale $savedLanguage");
//     }
//
//     // Notify listeners of the change
//     notifyListeners();
//   }
//
//   // Persist the selected language to shared preferences
//   void _setLanguage(Locale locale) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(selectLanguage, locale.languageCode);
//   }
//
//   // Retrieve the saved language from shared preferences
//   Future<String> _getLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // Update currentLanguage field with the retrieved language (if available)
//     if (prefs.getString(selectLanguage) != null) {
//       currentLanguage = prefs.getString(selectLanguage)!;
//     } else {
//       currentLanguage = "English"; // Set a default language if none is saved
//     }
//
//     // Return the saved language or a default value
//     return prefs.getString(selectLanguage) ?? " ";
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeProvider extends ChangeNotifier {
  Locale? _appLocale;

  Locale? get locale => _appLocale;

  TextDirection textDire = TextDirection.ltr;

  void textDirectionControl() {
    textDire =
    (textDire == TextDirection.ltr) ? TextDirection.rtl : TextDirection.ltr;
    notifyListeners();
  }

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _appLocale = type;
    if (_appLocale == const Locale('en')) {
      await sp.setString('language_code', 'en');
    } else  {
      await sp.setString('language_code', 'ur');
    }

    notifyListeners();
  }




}



// import 'package:flutter/widgets.dart';
//
// import '../../Utils/localizationPrefs.dart';
//
// import '../support_languages.dart';
//
// class LocaleProvider with ChangeNotifier {
//   /// this is the shared prefs class where i set and get data
//   LocalizationPrefs localePrefs = LocalizationPrefs();
//   Locale? _locale;
//
//   LocaleProvider() {
//     // Load theme status when ThemeProvider is created
//     loadLocale();
//   }
//
//   Locale? get locale => _locale;
//
//   void setLocale(Locale locale) {
//     ///we don't accept other locales(languages without defined in all )
//     if (!SupportLanguages.languages.contains(locale)) return;
//
//     _locale = locale;
//     localePrefs.setLanguage(locale);
//     notifyListeners();
//   }
//
//   void clearLocale() {
//     _locale = null;
//     notifyListeners();
//   }
//
//   Future<void> loadLocale() async {
//     String savedLanguage = await localePrefs.getLanguage();
//     _locale = Locale(savedLanguage);
//     notifyListeners();
//   }
// }