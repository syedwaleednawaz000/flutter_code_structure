import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_app_bar.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_drawer.dart';

import '../../../config/app_constant.dart';
import '../../../l10n/Provider/localization_provider.dart';
import '../../Theme/Provider/theme_provider.dart';
import '../Main/components/language_drop_down.dart';

enum Language { english, urdu }

class ProfileScreen extends StatefulWidget {
  String? screenName;
  ProfileScreen({required this.screenName,super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LanguageChangeProvider>(context, listen: false);
  }

  bool isDarkMode = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List languageText = [
      "English",
      "Urdu",
      "Greek",
    ];
    return Scaffold(
      drawer: const CustomDrawer(),
      key: _scaffoldKey,

      /// this is abid custom app bar
      appBar: customAppBar(
        appBarText: widget.screenName!,
        leadingIcon: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),

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
          Consumer<LanguageChangeProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Container(
                  height: 48.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                    color: provider.current ==
                        languageText.indexOf(languageText[provider.current])
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(provider.selectedLanguage == 'ur'
                            ? 'Urdu'
                            : provider.selectedLanguage == 'el'
                            ? "Greek"
                            : 'English'),
                        DropdownButton<String>(
                          underline: const SizedBox(),
                          // value: languageText[provider.current].toString(),
                          onChanged: (String? selectedLanguage) async {
                            int index = languageText.indexOf(selectedLanguage!);
                            print("***** Selected Index $index");

                            // Save the selected index to SharedPreferences
                            SharedPreferences sp =
                            await SharedPreferences.getInstance();
                            sp.setInt('selectedLanguageIndex', index);

                            provider.setCurrent(index);
                            provider.changeLanguage(
                              Locale(TranslationList[index].languageName),
                            );
                          },
                          items: languageText
                              .map<DropdownMenuItem<String>>((language) {
                            return DropdownMenuItem(
                              value: language,
                              child: SizedBox(
                                height: 48.h,
                                width: 100.w,
                                child: Center(
                                  child: Text(
                                    language,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Consumer<ThemeProvider>(builder: (context, provider, child) {
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
  TranslationModel(languageName: "el", countryName: "GR"),
];