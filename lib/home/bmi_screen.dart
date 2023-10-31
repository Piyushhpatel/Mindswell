// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:mindswells/auth/auth_components/rounded_button.dart';
// import 'package:mindswells/auth/auth_components/rounded_input_field.dart';
import 'package:mindswells/auth/auth_components/text_field_container.dart';
import 'package:mindswells/auth/components/background.dart';
import 'package:mindswells/auth/login.dart';
import 'package:mindswells/theme/dimensions.dart';
import 'package:mindswells/theme/my_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_database/firebase_database.dart';

class BmiScreen extends StatefulWidget {
  final String name;
  final String age;
  final String email;
  final String password;
  const BmiScreen(
      {Key? key,
      required this.name,
      required this.age,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  //CONTROLLERS
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();

  // print("Email: $_email");
  // print("Password: $_password");
  // print("Name: $_name");
  // print("Age: $_age");
  // print("Height: $height");
  // print("Weight: $weight");

  void saveData() async {
    final _heightText = _heightController.text;
    final _weightText = _weightController.text;
    final _email = widget.email;
    final _password = widget.password;
    final _name = widget.name;
    final _age = widget.age;

    // Validate user input
    if (_heightText.isEmpty || _weightText.isEmpty) {
      // You should handle this case by showing an error message to the user.
      return;
    }

    final height = double.tryParse(_heightText);
    final weight = double.tryParse(_weightText);

    if (height == null || weight == null) {
      // Handle invalid input, e.g., show an error message to the user.
      return;
    }

    DatabaseReference ref = FirebaseDatabase.instance.ref();

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("Nothing");
    } else {
      try {
        // Set data under the user uid node
        ref.child(user.uid).set({
          'email': _email,
          'password': _password,
          'name': _name,
          'age': _age,
          'height': height,
          'weight': weight,
        });

        // Data saved successfully, navigate to the home screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } catch (e) {
        // Handle any errors that occur during the database operation, e.g., show an error message.
        print("Error: $e");
      }
    }
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
                        hintText: "Your Weight (in Kgs)",
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
                        hintText: "Your Height (in Feets)",
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
