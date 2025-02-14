import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAmkAKDCIZykig0lPB-jj98FmI4TFEm-qA",
            authDomain: "yum-spot-hjl93d.firebaseapp.com",
            projectId: "yum-spot-hjl93d",
            storageBucket: "yum-spot-hjl93d.appspot.com",
            messagingSenderId: "1058981019015",
            appId: "1:1058981019015:web:3193b04d2705bf0c9a2722",
            measurementId: "G-WWBHBNPJ5Z"));
  } else {
    await Firebase.initializeApp();
  }
}
