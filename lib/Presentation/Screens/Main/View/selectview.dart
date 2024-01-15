// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:simple_flutter_project/Presentation/Theme/Provider/theme_provider.dart';
// import 'package:simple_flutter_project/Presentation/Screens/Home/View/homeview.dart';
// import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_consumer.dart';
// import 'package:simple_flutter_project/Presentation/Screens/Main/components/language_drop_down.dart';
// import 'package:simple_flutter_project/config/app_constant.dart';
// import 'package:simple_flutter_project/config/app_router_constants.dart';
// import 'package:simple_flutter_project/Utils/utils.dart';
// import '../../HomeNew/View/home_data_get_from_api_selector.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   bool isSwitched = false;
//
//   var textValue = 'Switch is OFF';
//
//   void toggleSwitch(bool value) {
//     if (isSwitched == false) {
//       setState(() {
//         isSwitched = true;
//         textValue = 'Switch Button is ON';
//       });
//       print('Switch Button is ON');
//     } else {
//       setState(() {
//         isSwitched = false;
//         textValue = 'Switch Button is OFF';
//       });
//       print('Switch Button is OFF');
//     }
//   }
//
//   bool isDarkMode = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Consumer<ThemeNotifier>(builder: (context, provider, child) {
//             //   return Switch(
//             //     onChanged: (bool value) async {
//             //       final prefs = await SharedPreferences.getInstance();
//             //       prefs.setBool("themeValue", value);
//             //       provider.setTheme(themeValue: value);
//             //     },
//             //     // onChanged: toggleSwitch,
//             //     value: AppConstant.themValue,
//             //
//             //     activeColor: Colors.blue,
//             //     activeTrackColor: Colors.blueAccent,
//             //     inactiveThumbColor: Colors.white,
//             //     inactiveTrackColor: Colors.grey,
//             //   );
//             // }),
//
//             /// this is abid drop down for language localization
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //   children: [
//             //     Text(
//             //       'Select Language',
//             //       style: TextStyle(color: Theme.of(context).primaryColor),
//             //     ),
//             //     const LanguageDropDown(),
//             //   ],
//             // ),
//
//             ElevatedButton(
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const Home()),
//               ),
//               child: const Text('Counter'),
//             ),
//             ElevatedButton(
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const HomeAPIConsumer()),
//               ),
//               child: const Text('Consumer'),
//             ),
//             ElevatedButton(
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const HomeAPISelector()),
//               ),
//               child: const Text('Selector'),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Theme.of(context).primaryColor,
//               ),
//               onPressed: () {
//                 context
//                     .pushNamed(AppRouterConstants.navigationDrawerMainScreen);
//               },
//               child: Text(
//                 'Go to New Code',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
