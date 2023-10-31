import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:mindswells/auth/login.dart';
import 'package:mindswells/pages/introduction_screen.dart';
// import 'package:mindswells/home/screens/main_screen.dart';
// import 'package:mindswells/auth/login.dart';
// import 'package:mindswells/pages/introduction_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String age = "";
  String height = "";
  String weight = "";
  String email = "";
  String bmi = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void logOut() async {
    try {
      Navigator.of(context).pushNamedAndRemoveUntil(
          IntroductionScreen.routeName, (Route<dynamic> route) => false);
      FirebaseAuth.instance.signOut(); // Sign out the user
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  Future<void> fetchUserData() async {
    User? userId = FirebaseAuth.instance.currentUser;

    if (userId == null) {
      print("No User Id Exist");
    } else {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child(userId.uid).get();
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          name = values['name'];
          age = values['age'];
          height = values['height'].toString();
          weight = values['weight'].toString();
          email = values['email'];
          double h = int.parse(height) * 0.305;
          int w = int.parse(weight);
          double value = w / (h * h);
          bmi = value.toStringAsFixed(2);
        });
      } else {
        print('No data available.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/demopfp.jpg",
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Age: 21",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 300,
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.deepPurpleAccent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Email : $email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.deepPurpleAccent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Height : $height feets",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.deepPurpleAccent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Weight : $weight Kg",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.deepPurpleAccent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Bmi : $bmi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // logOut();
            },
            child: Text(
              "Log Out",
              style: TextStyle(
                  fontSize: 21, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ));
  }
}
