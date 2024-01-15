import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../l10n/Provider/localization_provider.dart';
import '../../../../l10n/support_languages.dart';

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({super.key});

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  @override
  @override
  Widget build(BuildContext context) {


    return DropdownButtonHideUnderline(
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          final uniqueLanguages = Set.from(SupportLanguages.languages);
          return DropdownButton<Locale>(
            value: localeProvider.locale,
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              size: 50,
              color: Theme.of(context).primaryColor,
              weight: 100,
            ),
            items: uniqueLanguages.map(
                  (newValue) {
                return DropdownMenuItem<Locale>(
                  value: newValue,
                  onTap: () {
                    Provider.of<LocaleProvider>(context, listen: false).setLocale(newValue);
                  },
                  child: Center(
                    child: Text(
                      newValue.toString(),
                      style: TextStyle(fontSize: 32, color: Theme.of(context).primaryColor),
                    ),
                  ),
                );
              },
            ).toList(),
            onChanged: (Locale? locale) { // Ensure the type is Locale
              Provider.of<LocaleProvider>(context, listen: false).setLocale(locale!);
            },
            style: Theme.of(context).textTheme.bodyText1,
            dropdownColor: Theme.of(context).canvasColor,
          );
        },
      )
      ,
    );
  }
}
