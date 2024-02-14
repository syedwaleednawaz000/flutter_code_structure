import 'package:flutter/material.dart';
import 'AllLanguageTranslation/arabic.dart';
import 'AllLanguageTranslation/english.dart';
import 'AllLanguageTranslation/korean.dart';
import 'AllLanguageTranslation/spanish.dart';
import 'AllLanguageTranslation/urdu.dart';

class AppTranslations {
  final Locale locale;

  AppTranslations(this.locale);

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations)!;
  }

  static  final Map<String, Map<String, String>> _translations = {
    'en': English.english,
    'es': Spanish.spanish,
    'ur': Urdu.urdu,
    'ar': Arabic.arabic,
    'ko': Korean.korean,
  };

  String get greeting => _translations[locale.languageCode]?['greeting'] ?? '';
  String get selectLanguage => _translations[locale.languageCode]?['selectLanguage'] ?? '';
  String get counterText => _translations[locale.languageCode]?['counterText'] ?? '';
  String get consumerText => _translations[locale.languageCode]?['consumerText'] ?? '';
  String get selectorText => _translations[locale.languageCode]?['selectorText'] ?? '';
  String get profile => _translations[locale.languageCode]?['profile'] ?? '';
  String get my_profile => _translations[locale.languageCode]?['my_profile'] ?? '';
  String get my_course => _translations[locale.languageCode]?['my_course'] ?? '';
  String get my_premium => _translations[locale.languageCode]?['my_premium'] ?? '';
  String get saved_videos => _translations[locale.languageCode]?['saved_videos'] ?? '';
  String get edit_profile => _translations[locale.languageCode]?['edit_profile'] ?? '';
  String get logout => _translations[locale.languageCode]?['logout'] ?? '';
  String get abid_ullah_orakzai => _translations[locale.languageCode]?['abid_ullah_orakzai'] ?? '';

}