


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testd/Chess/PlayScreen.dart';
import 'package:testd/Chess/WelcoomScreen.dart';

import 'Chess/Login.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Login.id,
    routes: {
      WelcomScreen.id: (_) => WelcomScreen(),
      PlayScreen.id: (_) => PlayScreen(),
      Login.id: (_) => Login(),

    },
  ));
}
