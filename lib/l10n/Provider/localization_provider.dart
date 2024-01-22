
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationModel {
  final String languageName;
  final String countryName;

  TranslationModel({required this.languageName, required this.countryName});
}

class LanguageChangeProvider extends ChangeNotifier {
  Locale? _appLocale;
  Locale? get locale => _appLocale;

  TextDirection textDire = TextDirection.ltr;

  Locale? _locale;
  String _selectedLanguage = ''; // Added variable for selected language name

  String get selectedLanguage => _selectedLanguage;
  Locale? get appLocale => _locale;
  int _current = 0;
  int get current => _current;


  Future<void> textDirectionControl() async{
    textDire =
    (textDire == TextDirection.ltr) ? TextDirection.rtl : TextDirection.ltr;
    notifyListeners();
  }

  List<TranslationModel> translationList = [
    TranslationModel(languageName: "en", countryName: "US"),
    TranslationModel(languageName: "ur", countryName: "PK"),
  ];

  Future<void> setCurrent(int index) async {
    _current = index;
    _selectedLanguage = translationList[index].languageName; // Set selected language name
    _saveSelectedLanguage(); // Save selected language to SharedPreferences
    notifyListeners();
  }

  Future<void> _saveSelectedLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('selectedLanguage', _selectedLanguage);
  }

  Future<void> loadLocalLanguageCode() async{
    _loadLocale();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    _selectedLanguage = preferences.getString('selectedLanguage') ?? 'en';
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
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('languageCode', locale.languageCode);
    notifyListeners();
  }
}
