import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindswells/auth/login.dart'; // Your login screen
import 'package:mindswells/home/dashboard.dart';
import 'package:mindswells/home/feeling/widgets/splashScreen.dart'; // Your main dashboard screen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // You can show a loading indicator while Firebase initializes.
          } else {
            if (userSnapshot.hasData) {
              // User is authenticated, navigate to the main screen
              return DashBoard();
            } else {
              // User is not authenticated, navigate to the login screen
              return SplashScreen();
            }
          }
        },
      ),
    );
  }
}
