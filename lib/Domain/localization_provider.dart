import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/support_languages.dart';

class LocaleProvider with ChangeNotifier {

  Locale? _locale;

  LocaleProvider() {
    loadLocale();
  }

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    ///we don't accept other locales(languages without defined in all )
    if (!SupportLanguages.languages.contains(locale)) return;

    _locale = locale;
    _setLanguage(locale);
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

  Future<void> loadLocale() async {
    String savedLanguage = await _getLanguage();
    _locale = Locale(savedLanguage);
    notifyListeners();
  }
  static const selectLanguage = "selectLanguage";

  void _setLanguage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(selectLanguage, locale.languageCode);
  }

  Future<String> _getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectLanguage) ?? " ";
  }
}
