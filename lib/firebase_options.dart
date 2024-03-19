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
    apiKey: 'AIzaSyDDjXPQ8dZ_hW5cPIPazBE43RCVRaBcYZ8',
    appId: '1:985710276189:web:804e307eae7a336165e7b4',
    messagingSenderId: '985710276189',
    projectId: 'enzone-fb9d8',
    authDomain: 'enzone-fb9d8.firebaseapp.com',
    storageBucket: 'enzone-fb9d8.appspot.com',
    measurementId: 'G-J5SN9EHDTQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWnpvV1f4nZzao16KFFudMBJpNO5SrVS8',
    appId: '1:985710276189:android:1de8ad2afb591ef665e7b4',
    messagingSenderId: '985710276189',
    projectId: 'enzone-fb9d8',
    storageBucket: 'enzone-fb9d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgkb0rbZU7sYj3GHhOCz2hF7oB6MlhhCI',
    appId: '1:985710276189:ios:967b6795074d372c65e7b4',
    messagingSenderId: '985710276189',
    projectId: 'enzone-fb9d8',
    storageBucket: 'enzone-fb9d8.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgkb0rbZU7sYj3GHhOCz2hF7oB6MlhhCI',
    appId: '1:985710276189:ios:9ed0f283b71193d965e7b4',
    messagingSenderId: '985710276189',
    projectId: 'enzone-fb9d8',
    storageBucket: 'enzone-fb9d8.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
