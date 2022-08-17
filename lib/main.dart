import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:  const FirebaseOptions(
      apiKey: "AIzaSyCnd4JRusWy0T2_DE68nxKYefxVqz0I0Io",
      authDomain: "tal2a-9ca7b.firebaseapp.com",
      projectId: "tal2a-9ca7b",
      storageBucket: "tal2a-9ca7b.appspot.com",
      messagingSenderId: "184619389358",
      appId: "1:184619389358:web:95420bd726ac79d420783f",
      measurementId: "G-DK98K4VW1S"
  ),);
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar', 'EG')],
      path: 'assets/i18n',
      child: MyApp()));
}
