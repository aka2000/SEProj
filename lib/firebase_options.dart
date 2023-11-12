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
    apiKey: 'AIzaSyAWm0ng1WUj82wvvXIAgYMaAAayNsopWeg',
    appId: '1:537048900507:web:ce0eb60f950ecd8cc2773e',
    messagingSenderId: '537048900507',
    projectId: 'e-wallet-e41a0',
    authDomain: 'e-wallet-e41a0.firebaseapp.com',
    storageBucket: 'e-wallet-e41a0.appspot.com',
    measurementId: 'G-JG3C89HQTH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC45v6_SE63Ya-PHsrS8fgqKdLkmQEZgNk',
    appId: '1:537048900507:android:5c19928571d4443dc2773e',
    messagingSenderId: '537048900507',
    projectId: 'e-wallet-e41a0',
    storageBucket: 'e-wallet-e41a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWDGU5NZLlYhmZQhesKA7mvST1EgVJ2Og',
    appId: '1:537048900507:ios:48ba6716424c088dc2773e',
    messagingSenderId: '537048900507',
    projectId: 'e-wallet-e41a0',
    storageBucket: 'e-wallet-e41a0.appspot.com',
    iosBundleId: 'com.example.ewallet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWDGU5NZLlYhmZQhesKA7mvST1EgVJ2Og',
    appId: '1:537048900507:ios:4b1f9f2c0643117ec2773e',
    messagingSenderId: '537048900507',
    projectId: 'e-wallet-e41a0',
    storageBucket: 'e-wallet-e41a0.appspot.com',
    iosBundleId: 'com.example.ewallet.RunnerTests',
  );
}