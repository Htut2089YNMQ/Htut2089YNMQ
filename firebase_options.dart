import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// Update these options with your project's Firebase configuration.
const FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: 'AIzaSyCrD98amstl6tALE8fyBWELeOrl5KrKKu4',
  appId: '1:230084172291:android:99e673de8093efb03d4c36',
  messagingSenderId: '230084172291',
  projectId: 'car-project-80bac',
  storageBucket: 'car-project-80bac.appspot.com',
  authDomain: 'car-project-80bac.firebaseapp.com',
  
);

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return firebaseOptions;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return firebaseOptions;
      case TargetPlatform.iOS:
        return firebaseOptions;
      case TargetPlatform.macOS:
        return firebaseOptions;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}