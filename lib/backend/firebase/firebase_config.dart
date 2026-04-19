import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAD_b0XKyw5sQfbBc9roqgNg3TycznPc38",
            authDomain: "encuestas-prometheus-9tzwei.firebaseapp.com",
            projectId: "encuestas-prometheus-9tzwei",
            storageBucket: "encuestas-prometheus-9tzwei.appspot.com",
            messagingSenderId: "1020500998533",
            appId: "1:1020500998533:web:41af05c3ab85343a64ecec"));
  } else {
    await Firebase.initializeApp();
  }
}
