import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindswells/auth/components/background.dart';
import 'package:mindswells/auth/signup_components/detail.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // To control the loading state
  String _email = ""; // Local variable to store email
  String _password = ""; // Local variable to store password

  void _navigateToLoginScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Details(
            email: _email, password: _password), // Replace with your login page
      ),
    );
  }

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        _email = _emailController.text.trim(); // Store email
        _password = _passwordController.text; // Store password
        await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        // If the signup is successful, navigate to the login screen
        _navigateToLoginScreen();
      } catch (e) {
        print(e);
        // Handle errors (e.g., email already in use, weak password, etc.).
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
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
                            contentPadding: EdgeInsets.all(
                                16.0), // Add padding to text input
                            border:
                                InputBorder.none, // Remove the default border
                          ),
                          style: TextStyle(
                              fontSize: 18.0), // Adjust the text size as needed
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
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
                            contentPadding: EdgeInsets.all(
                                16.0), // Add padding to text input
                            border:
                                InputBorder.none, // Remove the default border
                          ),
                          style: TextStyle(
                              fontSize: 18.0), // Adjust the text size as needed
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
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
                          onPressed: _isLoading ? null : _signup,
                          child: _isLoading
                              ? CircularProgressIndicator() // Show a loading indicator
                              : Text(
                                  'Sign Up',
                                  style: TextStyle(fontSize: 20),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
