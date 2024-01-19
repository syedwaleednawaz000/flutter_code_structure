import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:simple_flutter_project/main.dart';

class FireBaseApi{
  ///Create an instance of firebase Messaging
  final _firebaseMessaging =FirebaseMessaging.instance;
  ///Function to initialize notifications
Future<void> initNotification() async{
  ///Request Permission from user(will prompt user)
  await _firebaseMessaging.requestPermission();

  ///fetch the FCM token from this device
  final FCMToken = await _firebaseMessaging.getToken();

  ///print the FCM token from this device
  print("**************** MY TOKEN IS = $FCMToken ******************");
  initPushNotification();
}

  ///function to handle received messages
void handleMessage(RemoteMessage ? message){
  ///if the message is null, do noting
  if(message == null) return;


  ///navigate to new screen when message is received and user taps notifications
  navigatorKey.currentState?.pushNamed('/NotificationScreen',arguments: message);
}
  ///function to initialized foreground and background settings
Future initPushNotification() async{

  ///handle notification if the app was terminated and now open
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  ///attach event listeners for when a notifications opens the app
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}
}