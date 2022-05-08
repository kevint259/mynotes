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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8LLhL2RlQY-ervHhIfCFmmttkJ2bzseY',
    appId: '1:1006972259028:android:625a09788c5a9743ae8941',
    messagingSenderId: '1006972259028',
    projectId: 'mynotes-kev1',
    storageBucket: 'mynotes-kev1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVxYNE32s9Cc4OWGogdNl-3Dy1C32nySU',
    appId: '1:1006972259028:ios:f3199d7bb2f3c839ae8941',
    messagingSenderId: '1006972259028',
    projectId: 'mynotes-kev1',
    storageBucket: 'mynotes-kev1.appspot.com',
    iosClientId: '1006972259028-3li79bkaeja835gsedrtkb0sv04l3u0q.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningdart',
  );
}