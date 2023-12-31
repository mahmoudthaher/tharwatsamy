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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA8mTzUyi6ixy6QyG5fI_SK4oSfI3VBI10',
    appId: '1:597349992371:web:ebf9a95f73266a1f826dc6',
    messagingSenderId: '597349992371',
    projectId: 'chat-app-6bd93',
    authDomain: 'chat-app-6bd93.firebaseapp.com',
    storageBucket: 'chat-app-6bd93.appspot.com',
    measurementId: 'G-RFDLBT45PE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsmhDDMLjenBjdDI7My-7DxDX9meXcT8U',
    appId: '1:597349992371:android:24aa1a92a5b410c6826dc6',
    messagingSenderId: '597349992371',
    projectId: 'chat-app-6bd93',
    storageBucket: 'chat-app-6bd93.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5lH_l3ATR41v8EWDFLR9adwZ7bQ4E1Ko',
    appId: '1:597349992371:ios:aa22c37ffdd552fb826dc6',
    messagingSenderId: '597349992371',
    projectId: 'chat-app-6bd93',
    storageBucket: 'chat-app-6bd93.appspot.com',
    iosBundleId: 'com.example.newProject',
  );
}
