import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_translation.dart';


class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  final Locale overriddenLocale;

  const AppTranslationsDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'ur', 'ar', 'ko'].contains(locale.languageCode);
  }

  @override
  Future<AppTranslations> load(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    final countryCode = prefs.getString('country_code') ?? 'US';
    final savedLocale = Locale(languageCode, countryCode);
    return AppTranslations(savedLocale);
  }

  @override
  bool shouldReload(AppTranslationsDelegate old) {
    return overriddenLocale != old.overriddenLocale;
  }
}