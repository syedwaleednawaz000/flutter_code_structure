// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:simple_flutter_project/l10n/Provider/localization_provider.dart';
//
// import '../../../../l10n/support_languages.dart';
//
// class LanguageDropDown extends StatefulWidget {
//   const LanguageDropDown({Key? key}) : super(key: key);
//
//   @override
//   _LanguageDropDownState createState() => _LanguageDropDownState();
// }
//
//
// class _LanguageDropDownState extends State<LanguageDropDown> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LocaleProvider>(context);
//     return DropdownButtonHideUnderline(
//       child: DropdownButton(
//         value: provider.locale,
//         icon: const Icon(
//           Icons.arrow_drop_down_sharp,
//           size: 50,
//           color: Colors.black,
//         ),
//         items:
//         SupportLanguages.languages.map((e) {
//           return DropdownMenuItem(
//             value: e,
//             onTap: (){
//               provider.setLocale(e);
//             },
//
//             child: Text(e.toString()),
//           );
//         }).toList(),
//         onChanged: (locale) {
//           provider.setLocale(locale!);
//         },
//       ),
//     );
//   }
// }
//
//
