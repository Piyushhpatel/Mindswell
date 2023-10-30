import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindswells/auth/components/background.dart';
import 'package:mindswells/auth/signup.dart';
import 'package:mindswells/home/dashboard.dart';
import 'package:mindswells/home/feeling/widgets/customAlertDialog.dart';
import 'package:mindswells/theme/my_colors.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool userDoesNotExist = false;

  Future<void> _login(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    try {
      // First, check if the user exists with the provided email and password
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        // User does not exist or login failed
        // Set the flag to display the message.
        setState(() {
          userDoesNotExist = true;
        });
      } else {
        // Successfully logged in, navigate to the main screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      }
    } catch (e) {
      // Handle other authentication errors
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            // Text input for phone (use as username) and password
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                // key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius as needed
                        border: Border.all(
                          color: Colors
                              .deepPurple, // Adjust the border color as needed
                          width: 1.0, // Adjust the border width as needed
                        ),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding:
                              EdgeInsets.all(16.0), // Add padding to text input
                          border: InputBorder.none, // Remove the default border
                        ),
                        style: TextStyle(
                            fontSize: 18.0), // Adjust the text size as needed
                      ),
                    ),
                    if (userDoesNotExist)
                      Text(
                        "User doesn't exist or login failed.",
                        style: TextStyle(
                          color:
                              Colors.red, // Customize the text color as needed.
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius as needed
                        border: Border.all(
                          color: Colors
                              .deepPurple, // Adjust the border color as needed
                          width: 1.0, // Adjust the border width as needed
                        ),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          contentPadding:
                              EdgeInsets.all(16.0), // Add padding to text input
                          border: InputBorder.none, // Remove the default border
                        ),
                        style: TextStyle(fontSize: 18.0),
                        // Adjust the text size as needed
                      ),
                    ),
                    Container(
                      width: double
                          .infinity, // Makes the button take the full width of the screen
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                      height: 45, // Optional margin for
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30.0), // Adjust the radius as needed
                          ),
                        ),
                        onPressed: () {
                          _login(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              "Don’t have an Account ? ",
              style: TextStyle(color: MyColor.kPrimaryColor),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: const Text(
                "Sign up",
                style: TextStyle(
                  color: MyColor.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
