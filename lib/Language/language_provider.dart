import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _selectedLanguage = Locale('en', 'US');
List<Locale> supportedLanguages = [
  const Locale('en', 'US'),
  const Locale('es', 'ES'),
  const Locale('ur', 'PK'),
  const Locale('ar', 'SA'),
  const Locale('ko', 'KR'),
];
  LanguageProvider() {
    _loadSelectedLanguage();
  }

  Locale get selectedLanguage => _selectedLanguage;

  void _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    final countryCode = prefs.getString('country_code') ?? 'US';
    _selectedLanguage = Locale(languageCode, countryCode);
    notifyListeners();
  }

  Future<void> updateLanguage(Locale newLocale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLocale.languageCode);
    await prefs.setString('country_code', newLocale.countryCode!);
    _selectedLanguage = newLocale;
    notifyListeners();
  }
}