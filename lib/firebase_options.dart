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
    apiKey: 'AIzaSyBSSx_er9eEMfZz3lfz6CUFkVE7vfPsPwI',
    appId: '1:989084525226:web:2824837700d7303133e6d3',
    messagingSenderId: '989084525226',
    projectId: 'newsapp-e7c57',
    authDomain: 'newsapp-e7c57.firebaseapp.com',
    storageBucket: 'newsapp-e7c57.appspot.com',
    measurementId: 'G-6SQV6HCEZV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4QOh2dtBnNd9VDOsfV-_Sov6K7VPQYH8',
    appId: '1:989084525226:android:92c84f379580820d33e6d3',
    messagingSenderId: '989084525226',
    projectId: 'newsapp-e7c57',
    storageBucket: 'newsapp-e7c57.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNIko9bAcNv_8xnb48xuhH0hBcMK8f1ng',
    appId: '1:989084525226:ios:acd2eeb18ad2ee3733e6d3',
    messagingSenderId: '989084525226',
    projectId: 'newsapp-e7c57',
    storageBucket: 'newsapp-e7c57.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNIko9bAcNv_8xnb48xuhH0hBcMK8f1ng',
    appId: '1:989084525226:ios:acd2eeb18ad2ee3733e6d3',
    messagingSenderId: '989084525226',
    projectId: 'newsapp-e7c57',
    storageBucket: 'newsapp-e7c57.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBSSx_er9eEMfZz3lfz6CUFkVE7vfPsPwI',
    appId: '1:989084525226:web:f0613c0ee8543de733e6d3',
    messagingSenderId: '989084525226',
    projectId: 'newsapp-e7c57',
    authDomain: 'newsapp-e7c57.firebaseapp.com',
    storageBucket: 'newsapp-e7c57.appspot.com',
    measurementId: 'G-58RKKMMW01',
  );

}