import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_code_structure/Language/language_provider.dart';

import 'package:flutter_code_structure/config/app_router_constants.dart';
import 'package:flutter_code_structure/my_size/my_size.dart';

import '../../../../config/app_constant.dart';
import '../../../Theme/Provider/theme_provider.dart';
import '../../../Widget/custom_app_bar.dart';
import '../../Dashboard/components/custom_drawer.dart';



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
    Provider.of<LanguageProvider>(context, listen: false);
  }

  bool isDarkMode = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    List languageText = [
      "English",
      "Urdu",
      "Greek",
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      drawer:  const CustomDrawer(),
      key: _scaffoldKey,

      /// this is abid custom app bar
      appBar: customAppBar(
        onTapBack: (){
          context.go(AppRouteConstants.dashBoardScreen);
        },
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
              padding:  EdgeInsets.all(MySize.size8),
              child: Stack(
                children: [
                  SizedBox(
                    width: MySize.size120,
                    height: MySize.size120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(MySize.size100),
                        child: const Image(
                            image: NetworkImage(
                                "https://picsum.photos/250?image=9"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: MySize.size35,
                      height: MySize.size35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MySize.size100),
                          color: Colors.blue),
                      child:  Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: MySize.size20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          LanguageDropDown(),
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
class LanguageDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final selectedLanguage = languageProvider.selectedLanguage;
    return DropdownButton<Locale>(
      value: selectedLanguage,
      onChanged: (Locale? locale) {
        if (locale != null) {
          languageProvider.updateLanguage(locale);
        }
      },
      items: const [
        DropdownMenuItem(
          value: Locale('en', 'US'),
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: Locale('es', 'ES'),
          child: Text('Spanish'),
        ),
        DropdownMenuItem(
          value: Locale('ur', 'PK'),
          child: Text('Urdu'),
        ),
        DropdownMenuItem(
          value: Locale('ar', 'SA'),
          child: Text('Arabic'),
        ),
        DropdownMenuItem(
          value: Locale('ko', 'KR'),
          child: Text('Korean'),
        ),
      ],
    );
  }
}

