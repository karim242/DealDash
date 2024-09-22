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
    apiKey: 'AIzaSyBiFCG3UTuS9Bi1fBeBHZMXD1ku0TGsRHo',
    appId: '1:401385978148:web:fe0e63b97a1edb4cc11bb1',
    messagingSenderId: '401385978148',
    projectId: 'dealdash-878ba',
    authDomain: 'dealdash-878ba.firebaseapp.com',
    storageBucket: 'dealdash-878ba.appspot.com',
    measurementId: 'G-0E8SX5GE3N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCv2As0cXtnY_piXdb_dP6gaLAOAz1a-54',
    appId: '1:401385978148:android:8ddcd918e78efa00c11bb1',
    messagingSenderId: '401385978148',
    projectId: 'dealdash-878ba',
    storageBucket: 'dealdash-878ba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOc_Cu8uiDidDOAGBMC4I4RHOjh9XYsj4',
    appId: '1:401385978148:ios:9c30006bff52c0bbc11bb1',
    messagingSenderId: '401385978148',
    projectId: 'dealdash-878ba',
    storageBucket: 'dealdash-878ba.appspot.com',
    iosBundleId: 'com.example.dealdash',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOc_Cu8uiDidDOAGBMC4I4RHOjh9XYsj4',
    appId: '1:401385978148:ios:9c30006bff52c0bbc11bb1',
    messagingSenderId: '401385978148',
    projectId: 'dealdash-878ba',
    storageBucket: 'dealdash-878ba.appspot.com',
    iosBundleId: 'com.example.dealdash',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBiFCG3UTuS9Bi1fBeBHZMXD1ku0TGsRHo',
    appId: '1:401385978148:web:b1b98969ae1ca726c11bb1',
    messagingSenderId: '401385978148',
    projectId: 'dealdash-878ba',
    authDomain: 'dealdash-878ba.firebaseapp.com',
    storageBucket: 'dealdash-878ba.appspot.com',
    measurementId: 'G-5MHLFGKD0V',
  );
}
