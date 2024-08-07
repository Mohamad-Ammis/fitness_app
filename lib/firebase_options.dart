// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBNbOElM4kLzDVvlLPV38WyswSQNyKeE7w',
    appId: '1:786363053751:web:f6e937947082fe81e3bf32',
    messagingSenderId: '786363053751',
    projectId: 'home-workout-24924',
    authDomain: 'home-workout-24924.firebaseapp.com',
    storageBucket: 'home-workout-24924.appspot.com',
    measurementId: 'G-F1EQZX1752',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBF5gEi9qDGg1i0hvFTdHv0WKmQvf2e5HI',
    appId: '1:786363053751:android:1fdbb5d2cd868896e3bf32',
    messagingSenderId: '786363053751',
    projectId: 'home-workout-24924',
    storageBucket: 'home-workout-24924.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcHCNUurKkQwCqwFArpOy_emAGb7SdIpg',
    appId: '1:786363053751:ios:db4d3edb6e8a6ef0e3bf32',
    messagingSenderId: '786363053751',
    projectId: 'home-workout-24924',
    storageBucket: 'home-workout-24924.appspot.com',
    iosBundleId: 'com.example.fitnessapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcHCNUurKkQwCqwFArpOy_emAGb7SdIpg',
    appId: '1:786363053751:ios:db4d3edb6e8a6ef0e3bf32',
    messagingSenderId: '786363053751',
    projectId: 'home-workout-24924',
    storageBucket: 'home-workout-24924.appspot.com',
    iosBundleId: 'com.example.fitnessapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBNbOElM4kLzDVvlLPV38WyswSQNyKeE7w',
    appId: '1:786363053751:web:15599f7e1c0b6ba1e3bf32',
    messagingSenderId: '786363053751',
    projectId: 'home-workout-24924',
    authDomain: 'home-workout-24924.firebaseapp.com',
    storageBucket: 'home-workout-24924.appspot.com',
    measurementId: 'G-QYXVRC2QQ6',
  );
}
