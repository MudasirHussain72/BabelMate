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
    apiKey: 'AIzaSyDQr6ne83ff4Bj8RNAodiKF7OKWObL2Afk',
    appId: '1:1065271770041:web:feb6cafe4e8251f5025468',
    messagingSenderId: '1065271770041',
    projectId: 'babelmate',
    authDomain: 'babelmate.firebaseapp.com',
    storageBucket: 'babelmate.appspot.com',
    measurementId: 'G-Z7CKHYNVFR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXNvNIpAmpVuNEEy4DANL25Z-T4GL-wes',
    appId: '1:1065271770041:android:3d2e07e6f0c6a387025468',
    messagingSenderId: '1065271770041',
    projectId: 'babelmate',
    storageBucket: 'babelmate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQz6ZufAlhY76sLfLkdZ8P1Epgd0f_lhs',
    appId: '1:1065271770041:ios:84442c340975b5e7025468',
    messagingSenderId: '1065271770041',
    projectId: 'babelmate',
    storageBucket: 'babelmate.appspot.com',
    iosClientId: '1065271770041-0vlm4jeg9uphg0p3g1o0dd4g870tkct8.apps.googleusercontent.com',
    iosBundleId: 'com.example.babelMate',
  );
}
