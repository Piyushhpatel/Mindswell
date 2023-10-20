// import 'package:fitness_app_megahack/Diet/Diet1.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mindswells/home/diet/diet.dart';
import 'package:mindswells/theme/dimensions.dart';
import 'package:mindswells/theme/flart_button.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Second',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Diet Plan",
            ),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(Dimensions.height20)),
            Container(
              height: Dimensions.height250,
              width: Dimensions.width500,
              decoration: new BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.height20)),
                image: DecorationImage(
                  image: new AssetImage('assets/Diet/Diet.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: Dimensions.height150,
                      width: Dimensions.width150,
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(Dimensions.height15),
                            side: BorderSide(color: Colors.purple)),
                        color: Colors.white,
                        textColor: Colors.purple,
                        padding: EdgeInsets.all(Dimensions.height6),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Diet()),
                          );
                        },
                        child: Text(
                          "Weekly Diet".toUpperCase(),
                          style: TextStyle(
                            fontSize: Dimensions.height15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Dimensions.height150,
                      width: Dimensions.width150,
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(Dimensions.height15),
                            side: BorderSide(color: Colors.purple)),
                        color: Colors.white,
                        textColor: Colors.purple,
                        padding: EdgeInsets.all(Dimensions.height6),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Diet()),
                          );
                        },
                        child: Text(
                          "Weight Gain".toUpperCase(),
                          style: TextStyle(
                            fontSize: Dimensions.height15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: Dimensions.height150,
                      width: Dimensions.width150,
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(Dimensions.height15),
                            side: BorderSide(color: Colors.purple)),
                        color: Colors.white,
                        textColor: Colors.purple,
                        padding: EdgeInsets.all(Dimensions.height6),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Diet()),
                          );
                        },
                        child: Text(
                          "Weight Lose".toUpperCase(),
                          style: TextStyle(
                            fontSize: Dimensions.height15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Dimensions.height150,
                      width: Dimensions.width150,
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                new BorderRadius.circular(Dimensions.height15),
                            side: BorderSide(color: Colors.purple)),
                        color: Colors.white,
                        textColor: Colors.purple,
                        padding: EdgeInsets.all(Dimensions.height6),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Diet()),
                          );
                        },
                        child: Text(
                          "Other Diets".toUpperCase(),
                          style: TextStyle(
                            fontSize: Dimensions.height15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
