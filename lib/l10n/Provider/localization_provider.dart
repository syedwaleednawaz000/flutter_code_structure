
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Presentation/Screens/profile/profile.dart';

class LanguageChangeProvider extends ChangeNotifier {
  Locale? _appLocale;

  Locale? get locale => _appLocale;

  TextDirection textDire = TextDirection.ltr;

  void textDirectionControl() {
    textDire =
    (textDire == TextDirection.ltr) ? TextDirection.rtl : TextDirection.ltr;
    notifyListeners();
  }

  Locale? _locale;
  String _selectedLanguage = ''; // Added variable for selected language name

  String get selectedLanguage => _selectedLanguage;

  Locale? get appLocale => _locale;
  int _current = 0;

  int get current => _current;

  Future<void> _loadSelectedLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    _selectedLanguage = preferences.getString('selectedLanguage') ?? 'en';
  }

  void setCurrent(int index) {
    _current = index;
    _selectedLanguage = TranslationList[index].languageName; // Set selected language name
    _saveSelectedLanguage(); // Save selected language to SharedPreferences
    notifyListeners();
  }

  Future<void> _saveSelectedLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('selectedLanguage', _selectedLanguage);
  }

  LanguageChangeProvider() {
    _loadLocale();
    _loadSelectedLanguage(); // Load selected language during initialization
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
