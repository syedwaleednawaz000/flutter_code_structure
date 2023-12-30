import 'package:flutter/widgets.dart';
import 'package:simple_flutter_project/Utils/locale_prefs.dart';
import '../l10n/support_languages.dart';

class LocaleProvider with ChangeNotifier {
  /// this is the shared prefs class where i set and get data
  LocalePrefs localePrefs = LocalePrefs();
  Locale? _locale;

  LocaleProvider() {
    // Load theme status when ThemeProvider is created
    loadLocale();
  }

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    ///we don't accept other locales(languages without defined in all )
    if (!SupportLanguages.languages.contains(locale)) return;

    _locale = locale;
    localePrefs.setLanguage(locale);
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

  Future<void> loadLocale() async {
    String savedLanguage = await localePrefs.getLanguage();
    _locale = Locale(savedLanguage);
    notifyListeners();
  }
}
