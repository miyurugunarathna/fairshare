import 'package:fairshare/config/secrets.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kDebugMode;

class DefaultFirebaseOptions {
  static FirebaseOptions? get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        if (kDebugMode) {
          print('DefaultFirebaseOptions have not been configured for this platform - '
              'you can reconfigure this by running the FlutterFire CLI again.');
        }
        return null;
    }
  }

  static FirebaseOptions android = FirebaseOptions(
    apiKey: Secrets.firebaseApiKey!,
    appId: Secrets.firebaseAppId!,
    messagingSenderId: Secrets.firebaseMessagingSenderId!,
    projectId: Secrets.firebaseProjectId!,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: Secrets.firebaseApiKey!,
    appId: Secrets.firebaseIOSAppId!,
    messagingSenderId: Secrets.firebaseMessagingSenderId!,
    projectId: Secrets.firebaseProjectId!,
    iosClientId: Secrets.firebaseIOSClientId,
    iosBundleId: 'com.gcect.tipapp',
  );
}
