import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCKBM6R3Id4PhULRM-K3QNsvrQ4mZMxgEY",
            authDomain: "store-1epw7p.firebaseapp.com",
            projectId: "store-1epw7p",
            storageBucket: "store-1epw7p.appspot.com",
            messagingSenderId: "972836853627",
            appId: "1:972836853627:web:511ec8596a13d51579cfde"));
  } else {
    await Firebase.initializeApp();
  }
}
