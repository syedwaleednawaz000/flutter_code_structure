import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  String text;
  IconData? leadingIcon;
  VoidCallback? onPressed;
  ListTileWidget(
      {super.key, required this.text, this.leadingIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(text),
      onTap: onPressed,
    );
  }
}
