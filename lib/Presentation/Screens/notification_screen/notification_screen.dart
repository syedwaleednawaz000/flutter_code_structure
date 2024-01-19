

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {

   const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Column(
      children: [
        Text(message.notification!.title.toString()),
        Text(message.notification!.body.toString()),
        Text(message.data.toString()),
      ],
    );
  }
}
