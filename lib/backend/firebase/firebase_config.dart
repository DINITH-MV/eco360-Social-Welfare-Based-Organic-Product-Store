import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBWZMq5o8-DlMCynCbxl-f6yxVpxCn_quI",
            authDomain: "e-c-o360-store-s9ahm7.firebaseapp.com",
            projectId: "e-c-o360-store-s9ahm7",
            storageBucket: "e-c-o360-store-s9ahm7.appspot.com",
            messagingSenderId: "1082295340695",
            appId: "1:1082295340695:web:d52b5c5b1e8005fb1023d2"));
  } else {
    await Firebase.initializeApp();
  }
}
