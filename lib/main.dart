import 'package:mindswells/auth/login.dart';
import 'package:mindswells/auth/signup.dart';
import 'package:mindswells/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindswells/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized.

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holistic',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginScreen(),
    );
  }
}
