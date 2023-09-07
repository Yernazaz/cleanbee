import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAsPLefwGOp4OeCtvBEk_Khr56Ou1kGXj0",
            authDomain: "qleanbee-1240a.firebaseapp.com",
            projectId: "qleanbee-1240a",
            storageBucket: "qleanbee-1240a.appspot.com",
            messagingSenderId: "555151907597",
            appId: "1:555151907597:web:24982e403991cb8dc6ee44",
            measurementId: "G-JR3XPNVFVY"));
  } else {
    await Firebase.initializeApp();
  }
}
