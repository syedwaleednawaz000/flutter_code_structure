import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_flutter_project/config/app_constant.dart';
import '../../../../Domain/localization_provider.dart';
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
      child: Consumer<LocaleProvider>(builder:  (context, localeProvider, child) {
        return DropdownButton(
          value: localeProvider.locale,
          icon: Icon(
            Icons.arrow_drop_down_sharp,
            size: 50,
            color:  Theme.of(context).primaryColor,
            weight: 100,
          ),
          items: SupportLanguages.languages.map(
                (newValue) {
              return DropdownMenuItem(
                value: newValue,
                onTap: () {
                  // final provider = Provider.of<LocaleProvider>(context, listen: false);
                  // localeProvider.setLocale(e);
                  Provider.of<LocaleProvider>(context, listen: false).setLocale(newValue);
                },
                child: Center(
                  child: Text(
                    newValue.toString(),
                    style: TextStyle(fontSize: 32, color:  Theme.of(context).primaryColor),
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (locale) {
            Provider.of<LocaleProvider>(context, listen: false).setLocale(locale!);
          },
        );
      },),
    );
  }
}
