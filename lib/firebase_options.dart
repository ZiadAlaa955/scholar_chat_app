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
    apiKey: 'AIzaSyBbEAhVSYOlyAy1wmfCH1whMM8_Vry87UE',
    appId: '1:1098362649326:web:73fa5977476cc4de4811ff',
    messagingSenderId: '1098362649326',
    projectId: 'scholar-chat-app-b22f7',
    authDomain: 'scholar-chat-app-b22f7.firebaseapp.com',
    storageBucket: 'scholar-chat-app-b22f7.firebasestorage.app',
    measurementId: 'G-X69BF4PDN5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhCcs2BP715UeOjVN69KngWI6yS_owkWM',
    appId: '1:1098362649326:android:63239a04add06f584811ff',
    messagingSenderId: '1098362649326',
    projectId: 'scholar-chat-app-b22f7',
    storageBucket: 'scholar-chat-app-b22f7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRK-LMkblDn306hFa56yu1F4Rjj3rPjEY',
    appId: '1:1098362649326:ios:967ccf28ca6c2abd4811ff',
    messagingSenderId: '1098362649326',
    projectId: 'scholar-chat-app-b22f7',
    storageBucket: 'scholar-chat-app-b22f7.firebasestorage.app',
    iosBundleId: 'com.example.scholarChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRK-LMkblDn306hFa56yu1F4Rjj3rPjEY',
    appId: '1:1098362649326:ios:967ccf28ca6c2abd4811ff',
    messagingSenderId: '1098362649326',
    projectId: 'scholar-chat-app-b22f7',
    storageBucket: 'scholar-chat-app-b22f7.firebasestorage.app',
    iosBundleId: 'com.example.scholarChatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbEAhVSYOlyAy1wmfCH1whMM8_Vry87UE',
    appId: '1:1098362649326:web:9a03cdf01bb0a0a94811ff',
    messagingSenderId: '1098362649326',
    projectId: 'scholar-chat-app-b22f7',
    authDomain: 'scholar-chat-app-b22f7.firebaseapp.com',
    storageBucket: 'scholar-chat-app-b22f7.firebasestorage.app',
    measurementId: 'G-Q4BT0QNVDH',
  );
}