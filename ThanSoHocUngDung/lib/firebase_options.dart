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
    apiKey: 'AIzaSyBuxLvGrI6Fx_b0ncWz1vNeRRl0ENGWbyE',
    appId: '1:530698299938:web:3dc6eae43db702cd59b87b',
    messagingSenderId: '530698299938',
    projectId: 'thansohocungdung-1e2c5',
    authDomain: 'thansohocungdung-1e2c5.firebaseapp.com',
    storageBucket: 'thansohocungdung-1e2c5.appspot.com',
    measurementId: 'G-Q7EM9WSG8Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBViczjWgc4GZxjSBNNf-fC0FkelV0Ouck',
    appId: '1:530698299938:android:fbe6568bd42e236659b87b',
    messagingSenderId: '530698299938',
    projectId: 'thansohocungdung-1e2c5',
    storageBucket: 'thansohocungdung-1e2c5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbwvEJQ-0bOXJmkKW0iHkMk1MmAoD-W2Q',
    appId: '1:530698299938:ios:ea210ec8b6fd99a659b87b',
    messagingSenderId: '530698299938',
    projectId: 'thansohocungdung-1e2c5',
    storageBucket: 'thansohocungdung-1e2c5.appspot.com',
    iosClientId: '530698299938-im2i9uoqg9jfq62vbf4dg7hut3p1h3d1.apps.googleusercontent.com',
    iosBundleId: 'com.amunselect.thansohocungdung.thansohocungdung',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbwvEJQ-0bOXJmkKW0iHkMk1MmAoD-W2Q',
    appId: '1:530698299938:ios:5f94b3b14f741d1159b87b',
    messagingSenderId: '530698299938',
    projectId: 'thansohocungdung-1e2c5',
    storageBucket: 'thansohocungdung-1e2c5.appspot.com',
    iosClientId: '530698299938-m5gf2vonj8kv8imvludpt5005d1be8g7.apps.googleusercontent.com',
    iosBundleId: 'com.amunselect.thansohocungdung.thansohocungdung.RunnerTests',
  );
}
