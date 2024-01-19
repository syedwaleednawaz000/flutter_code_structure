import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_constant.dart';
import '../../../l10n/Provider/localization_provider.dart';
import '../../Theme/Provider/theme_provider.dart';
import '../Main/components/language_drop_down.dart';

enum Language { english, urdu }

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;

  var textValue = 'Switch is OFF';

  // void toggleSwitch(bool value) {
  //   if (isSwitched == false) {
  //     setState(() {
  //       isSwitched = true;
  //       textValue = 'Switch Button is ON';
  //     });
  //     print('Switch Button is ON');
  //   } else {
  //     setState(() {
  //       isSwitched = false;
  //       textValue = 'Switch Button is OFF';
  //     });
  //     print('Switch Button is OFF');
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LanguageChangeProvider>(context, listen: false);
  }

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    List languageLists = [
      "English",
      "Urdu",
    ];
    List languageText = [
      "English",
      "Urdu",
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: NetworkImage(
                                "https://picsum.photos/250?image=9"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: languageLists.length,
              itemBuilder: (context, index) {
                return Consumer<LanguageChangeProvider>(
                    builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () {
                      provider.setCurrent(index);
                      provider.changeLanguage(
                          Locale(TranslationList[index].languageName));
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.h),
                      child: Container(
                        // width: 326,
                        height: 48.h,
                        // color: AppColors.textColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 14.h),
                        margin: EdgeInsets.only(bottom: 8.r),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: provider.current == index
                              ? Colors.grey
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            languageText[index].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          Consumer<ThemeNotifier>(builder: (context, provider, child) {
            return Switch(
              onChanged: (bool value) async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("themeValue", value);
                provider.setTheme(themeValue: value);
              },
              // onChanged: toggleSwitch,
              value: AppConstant.themValue,

              activeColor: Colors.blue,
              activeTrackColor: Colors.blueAccent,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            );
          }),
        ],
      ),
    );
  }
}

class TranslationModel {
  final String languageName;
  final String countryName;

  TranslationModel({required this.languageName, required this.countryName});
}

List<TranslationModel> TranslationList = [
  TranslationModel(languageName: "en", countryName: "US"),
  TranslationModel(languageName: "ur", countryName: "PK"),
];
