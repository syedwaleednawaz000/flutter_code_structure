import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _initializeLocalNotifications();
    await _requestPermission();
    await _retrieveFCMToken();

    // Handle initial message when the app is terminated
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen(_handleMessage);

    // Listen for messages that open the app
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission for notifications');
    } else {
      print('User declined or has not granted permission for notifications');
    }
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    print('Received message: ${message.messageId}');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
    );
  }

  Future<void> _retrieveFCMToken() async {
    String? token = await _messaging.getToken();
    print('FCM Token: $token');
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
