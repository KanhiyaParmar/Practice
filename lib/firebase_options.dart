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
    apiKey: 'AIzaSyC5s7rESOn7VQ3ISKut_hhttVJYMl9df-U',
    appId: '1:868910024589:web:e332f2d61c907bdb775fc4',
    messagingSenderId: '868910024589',
    projectId: 'crudtask-6c79e',
    authDomain: 'crudtask-6c79e.firebaseapp.com',
    storageBucket: 'crudtask-6c79e.appspot.com',
    measurementId: 'G-EC81WT4KJ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlsLw6h156lP4OCoJUMBt1ONv2JB-2PzQ',
    appId: '1:868910024589:android:6d00effd07414839775fc4',
    messagingSenderId: '868910024589',
    projectId: 'crudtask-6c79e',
    storageBucket: 'crudtask-6c79e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2QSQ4c0-PmghJkzkuBkFTGtW_hk5q9l8',
    appId: '1:868910024589:ios:12534333bbbbe4e1775fc4',
    messagingSenderId: '868910024589',
    projectId: 'crudtask-6c79e',
    storageBucket: 'crudtask-6c79e.appspot.com',
    iosClientId: '868910024589-h5dmkd2074rv17nbcshrhqf6m6tra1tf.apps.googleusercontent.com',
    iosBundleId: 'com.example.elredtask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2QSQ4c0-PmghJkzkuBkFTGtW_hk5q9l8',
    appId: '1:868910024589:ios:12534333bbbbe4e1775fc4',
    messagingSenderId: '868910024589',
    projectId: 'crudtask-6c79e',
    storageBucket: 'crudtask-6c79e.appspot.com',
    iosClientId: '868910024589-h5dmkd2074rv17nbcshrhqf6m6tra1tf.apps.googleusercontent.com',
    iosBundleId: 'com.example.elredtask',
  );
}
