import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindswells/theme/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindswells/pages/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mindswells/home/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 4;

  Future<void> checkFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool firstTime = prefs.getBool('first_time') ?? true;

    if (firstTime) {
      // The app is opened for the first time, navigate to IntroductionScreen
      prefs.setBool('first_time', false);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntroductionScreen()),
      );
    } else {
      // The app has been opened before, navigate to MainScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  startTime() async {
    return Timer(
      Duration(seconds: splashDuration),
      () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');

        // HereTo Navigate
        Navigator.push(
          context,
          // ignore: prefer_const_constructors
          MaterialPageRoute(builder: (context) => IntroductionScreen()),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
    checkFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColor.kPrimaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(10.0)),
              Text(
                'HOLISTIC',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 46),
                ),
              ),
              Container(
                child: Image.asset('assets/splash_screen/SplashScreen-2.gif'),
              ),
              Container(
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
