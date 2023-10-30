import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mindswells/auth/auth_components/text_field_container.dart';
import 'package:mindswells/auth/components/background.dart';
import 'package:mindswells/home/bmi_screen.dart';
import 'package:mindswells/theme/dimensions.dart';
import 'package:mindswells/theme/my_colors.dart';

class Details extends StatefulWidget {
  final String email;
  final String password;

  Details({required this.email, required this.password}); // Removed "super.key"

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _name = "";
  String _age = "";

  void _navigateToBMIScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => BmiScreen(
          name: _name,
          age: _age,
          email: widget.email, // Pass the email from the Details screen
          password:
              widget.password, // Pass the password from the Details screen
        ), // Replace with your login page
      ),
    );
  }

  Future<void> _createUser() async {
    try {
      _name = _nameController.text.trim();
      _age = _ageController.text.trim();

      _navigateToBMIScreen();
    } catch (e) {
      print(e);
      // Handle errors (e.g., email already in use, weak password, etc.).
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Personal Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: 200,
              ),
              SizedBox(height: 20),
              TextFieldContainer(
                child: TextField(
                  controller: _nameController,
                  cursorColor: MyColor.kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: MyColor.kPrimaryColor,
                    ),
                    hintText: "Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: _ageController,
                  cursorColor: MyColor.kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: MyColor.kPrimaryColor,
                    ),
                    hintText: "Age",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(Dimensions.height10)),
              ElevatedButton(
                onPressed: () {
                  _createUser();
                },
                child: const Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColor.kPrimaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width50,
                    vertical: Dimensions.height15,
                  ),
                  textStyle: TextStyle(
                    fontSize: Dimensions.height15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
