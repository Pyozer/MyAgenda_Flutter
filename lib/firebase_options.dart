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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2khIhFvRrRYJOzT0KQ6bglJeKHfE4eBE',
    appId: '1:518938880074:android:caff68f2e611d095',
    messagingSenderId: '518938880074',
    projectId: 'myagenda-57559',
    databaseURL: 'https://myagenda-57559.firebaseio.com',
    storageBucket: 'myagenda-57559.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxk4RY-4_83jVx1ZKVbQ1Hf389Xx8rjlk',
    appId: '1:518938880074:ios:caff68f2e611d095',
    messagingSenderId: '518938880074',
    projectId: 'myagenda-57559',
    databaseURL: 'https://myagenda-57559.firebaseio.com',
    storageBucket: 'myagenda-57559.appspot.com',
    androidClientId:
        '518938880074-lvlca2f1ugge92i9rekt9103qguru2n5.apps.googleusercontent.com',
    iosClientId:
        '518938880074-h3e92lgm29fm4bbhebbp02gb56auu33g.apps.googleusercontent.com',
    iosBundleId: 'com.pyozer.myagenda',
  );
}
