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

  // void changeLanguage(Locale type) async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   _appLocale = type;
  //
  //   if (_appLocale == const Locale('ur')) {
  //     await sp.setString('language_code', 'ur');
  //   } else {
  //     await sp.setString('language_code', 'en');
  //   }
  //
  //   notifyListeners();
  // }
  Locale? _locale;

  Locale? get appLocale => _locale;
  int _current = 0;

  int get current => _current;

  void setCurrent(int index) {
    _current = index;
    notifyListeners();
  }

  LanguageChangeController() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final preferences = await SharedPreferences.getInstance();
    final languageCode = preferences.getString('languageCode');
    if (languageCode != null) {
      _locale = Locale(languageCode);
    } else {
      _locale = const Locale('en');
    }
    notifyListeners();
  }

  Future<void> changeLanguage(Locale locale) async {
    _locale = locale;
    notifyListeners();
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('languageCode', locale.languageCode);
  }
}
