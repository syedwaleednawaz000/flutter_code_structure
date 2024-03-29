// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDYnsMr0Ods3Y5u9USEIxJrw79tiVPzTxo',
    appId: '1:943295536995:web:98c556a8353258842abd56',
    messagingSenderId: '943295536995',
    projectId: 'push-notification-f7d33',
    authDomain: 'push-notification-f7d33.firebaseapp.com',
    databaseURL: 'https://push-notification-f7d33-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'push-notification-f7d33.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgK0qrDZwgPLAjIWJRoPM7Vt8-7-K-QNw',
    appId: '1:943295536995:android:e05ba6c3bde951ec2abd56',
    messagingSenderId: '943295536995',
    projectId: 'push-notification-f7d33',
    databaseURL: 'https://push-notification-f7d33-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'push-notification-f7d33.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7l2ANDXdbvI5eAGtZrgNvITHoIjTKnu8',
    appId: '1:943295536995:ios:95c219d2d02387dc2abd56',
    messagingSenderId: '943295536995',
    projectId: 'push-notification-f7d33',
    databaseURL: 'https://push-notification-f7d33-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'push-notification-f7d33.appspot.com',
    iosBundleId: 'com.example.simpleFlutterProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7l2ANDXdbvI5eAGtZrgNvITHoIjTKnu8',
    appId: '1:943295536995:ios:95c219d2d02387dc2abd56',
    messagingSenderId: '943295536995',
    projectId: 'push-notification-f7d33',
    databaseURL: 'https://push-notification-f7d33-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'push-notification-f7d33.appspot.com',
    iosBundleId: 'com.example.simpleFlutterProject',
  );
}
