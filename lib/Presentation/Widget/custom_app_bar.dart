import 'package:flutter/material.dart';

AppBar customAppBar(
    {required String appBarText,
      required IconData leadingIcon,
      required VoidCallback onPressed,
      required VoidCallback onTapBack,
      List<Widget>? actions
    }) {
  return AppBar(
    title: Text(appBarText),
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.end
      ,
      children: [
      GestureDetector(
          onTap: onTapBack,
          child: const Icon(Icons.arrow_back_ios)),
      GestureDetector(
          onTap: onPressed,
          child:  Icon(leadingIcon))
    ],),
    actions: actions,
    centerTitle: true,
  );
}