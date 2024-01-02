import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Domain/theme_provider.dart';

class AppConstant{
  BuildContext context;

  AppConstant(this.context);

  bool get getTheme => Provider.of<ThemeProvider>(context).getDarkTheme;

  Color get getColor => getTheme ? Colors.white : Colors.black;
  static String userID = "";
  static String montMedium = "Mont-Medium";
  static String getUserToken = '';
}