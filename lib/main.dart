import 'package:assignment_authentication/profile_selection.dart';
import 'package:flutter/material.dart';

import 'frame_screen.dart';
import 'verify_phone.dart';
import 'mobile_no.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFirebase();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'language',
    routes: {
      'language': (context) => const Frame(),
      'phone': (context) => const MobileNumber(),
      'otp': (context) => const VerifyPhone(),
      'home': (context) => const ProfileSelection()
    },
  ));
}

_initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
