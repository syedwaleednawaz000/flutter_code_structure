import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Utils/utils.dart';
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
    final localeProvider = Provider.of<LocaleProvider>(context);
    final Color color = Utils(context).getColor;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: localeProvider.locale,
        icon: Icon(
          Icons.arrow_drop_down_sharp,
          size: 50,
          color: color,
          weight: 100,
        ),
        items: SupportLanguages.languages.map(
          (e) {
            return DropdownMenuItem(
              value: e,
              onTap: () {
                // final provider =
                //     Provider.of<LocaleProvider>(context, listen: false);
                localeProvider.setLocale(e);
              },
              child: Center(
                child: Text(
                  e.toString(),
                  style: TextStyle(fontSize: 32, color: color),
                ),
              ),
            );
          },
        ).toList(),
        onChanged: (locale) {
          localeProvider.setLocale(locale!);
        },
      ),
    );
  }
}
