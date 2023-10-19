// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:mindswells/auth/auth_components/rounded_button.dart';
// import 'package:mindswells/auth/auth_components/rounded_input_field.dart';
import 'package:mindswells/auth/auth_components/text_field_container.dart';
import 'package:mindswells/auth/components/background.dart';
import 'package:mindswells/home/home_screen.dart';
import 'package:mindswells/theme/dimensions.dart';
import 'package:mindswells/theme/my_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  //CONTROLLERS
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();

  saveData() {
    var height = double.parse(_heightController.text);
    var weight = double.parse(_weightController.text);

    SharedPreferences.getInstance().then((prefs) {
      prefs.setDouble('height', height);
      prefs.setDouble('weight', weight);
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          body: Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Enter Height and Weight",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFieldContainer(
                    child: TextField(
                      controller: _weightController,
                      cursorColor: MyColor.kPrimaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: MyColor.kPrimaryColor,
                        ),
                        hintText: "Your Weight (in lbs)",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextField(
                      controller: _heightController,
                      cursorColor: MyColor.kPrimaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: MyColor.kPrimaryColor,
                        ),
                        hintText: "Your Height (in inches)",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(Dimensions.height10)),
                  ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                      saveData();
                    },
                    child: const Text('Save'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.kPrimaryColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width50,
                            vertical: Dimensions.height15),
                        textStyle: TextStyle(
                            fontSize: Dimensions.height15,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
