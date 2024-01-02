import 'package:flutter/material.dart';

AppBar customAppBar(
    {required String appBarText,
    required IconData leadingIcon,
    required VoidCallback onPressed}) {
  return AppBar(
    title: Text(appBarText),
    leading: IconButton(
      icon: Icon(leadingIcon),
      onPressed: onPressed,
    ),
    centerTitle: true,
  );
}
