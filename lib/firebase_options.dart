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
    apiKey: 'AIzaSyDTjPKUKp73-lfJkomPO4ym0B3UMMd7A2k',
    appId: '1:535493893394:web:70314514e5a5290c3fe7cb',
    messagingSenderId: '535493893394',
    projectId: 'mcma-f134f',
    authDomain: 'mcma-f134f.firebaseapp.com',
    storageBucket: 'mcma-f134f.appspot.com',
    measurementId: 'G-WEPXC7SZFB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXC4oBlDLZvjrFRa512Ffh8oyVDUHCJc4',
    appId: '1:535493893394:android:743cc6384c434c6f3fe7cb',
    messagingSenderId: '535493893394',
    projectId: 'mcma-f134f',
    storageBucket: 'mcma-f134f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALNL6GZIE6d09aNEgkLENLhzwJTXF4GOg',
    appId: '1:535493893394:ios:2e24bbbcb63c6cbe3fe7cb',
    messagingSenderId: '535493893394',
    projectId: 'mcma-f134f',
    storageBucket: 'mcma-f134f.appspot.com',
    iosBundleId: 'com.example.mutlipleCalendarManagement',
  );
}
