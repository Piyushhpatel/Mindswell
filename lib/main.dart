import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mindswells/firebase_options.dart';
import 'package:mindswells/home/dashboard.dart';
import 'package:mindswells/pages/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  final introductionShown = prefs.getBool('introduction_shown') ?? false;

  runApp(MyApp(introductionShown: introductionShown));
}

class MyApp extends StatelessWidget {
  final bool introductionShown;

  MyApp({required this.introductionShown});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mindswell',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: introductionShown ? DashBoard() : IntroductionScreen(),
    );
  }
}
