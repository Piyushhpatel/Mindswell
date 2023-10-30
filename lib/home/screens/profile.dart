import 'package:flutter/material.dart';
import 'package:mindswells/auth/login.dart';
import 'package:mindswells/home/screens/main_screen.dart';
import 'package:mindswells/pages/introduction_screen.dart';

class ProfileScreen extends StatelessWidget {
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
                    "Jerry Patel",
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
                    "Email : pateljerry@gmail.com",
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
                    "Height : 6 feets",
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
                    "Weight : 65 Kg",
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
                    "Bmi : 20",
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
              Navigator.pop(context, MainScreen.routeName);
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
