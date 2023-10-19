import 'dart:async';
// import 'package:fitness_app_megahack/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindswells/pages/introduction_screen.dart';
import 'package:mindswells/theme/dimensions.dart';
import 'package:mindswells/theme/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 4;

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
              Padding(padding: EdgeInsets.all(Dimensions.height10)),
              Text(
                'HOLISTIC',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: Dimensions.height46),
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
