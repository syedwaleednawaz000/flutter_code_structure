import 'package:flutter/material.dart';

AppBar customAppBar(
    {required String appBarText,
      required IconData leadingIcon,
      required VoidCallback onPressed,List<Widget>? actions}) {
  return AppBar(
    title: Text(appBarText),
    leading: IconButton(
      icon: Icon(leadingIcon),
      onPressed: onPressed,
    ),
    actions: actions,
    centerTitle: true,
  );
}