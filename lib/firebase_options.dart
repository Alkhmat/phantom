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
    apiKey: 'AIzaSyCKdQoA7Fw2tywp3i0b-mrirARG1Urnpj4',
    appId: '1:1046953999095:web:82deeef7929f24f98ab1f2',
    messagingSenderId: '1046953999095',
    projectId: 'phantom-36299',
    authDomain: 'phantom-36299.firebaseapp.com',
    storageBucket: 'phantom-36299.appspot.com',
    measurementId: 'G-HM1BDRCZ0T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYUMXm2BzQjlEzeb7CvAISDK36dMWWZOo',
    appId: '1:1046953999095:android:4454475f397d35088ab1f2',
    messagingSenderId: '1046953999095',
    projectId: 'phantom-36299',
    storageBucket: 'phantom-36299.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHEvGaW3yMgvlXNNQAilsfY77yqypEJRc',
    appId: '1:1046953999095:ios:ed93a3dd36b45b428ab1f2',
    messagingSenderId: '1046953999095',
    projectId: 'phantom-36299',
    storageBucket: 'phantom-36299.appspot.com',
    iosBundleId: 'com.example.phantom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHEvGaW3yMgvlXNNQAilsfY77yqypEJRc',
    appId: '1:1046953999095:ios:ed93a3dd36b45b428ab1f2',
    messagingSenderId: '1046953999095',
    projectId: 'phantom-36299',
    storageBucket: 'phantom-36299.appspot.com',
    iosBundleId: 'com.example.phantom',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKdQoA7Fw2tywp3i0b-mrirARG1Urnpj4',
    appId: '1:1046953999095:web:84d04df5e749ac148ab1f2',
    messagingSenderId: '1046953999095',
    projectId: 'phantom-36299',
    authDomain: 'phantom-36299.firebaseapp.com',
    storageBucket: 'phantom-36299.appspot.com',
    measurementId: 'G-HB2NNBGQ19',
  );
}
