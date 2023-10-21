import 'package:flutter/material.dart';
// import 'package:mindswells/home/feeling/feeling.dart';
import 'package:mindswells/home/feeling/models/problem.dart';
import 'package:mindswells/home/feeling/screens/triage.dart';
import 'package:mindswells/home/screens/pedometer_1.dart';
import 'package:mindswells/theme/dimensions.dart';
import 'package:mindswells/theme/emoticons.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/mainscreen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _HomePageState();
}

class _HomePageState extends State<MainScreen> {
  var dt = DateTime.now();
  var newFormat = DateFormat("yMMMEd");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height20,
                ),
                //greeting row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Welcome!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          newFormat.format(dt),
                          style: TextStyle(color: Colors.deepPurple[100]),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.deepPurple,
                      ),
                    )
                  ],
                ),

                SizedBox(height: 25),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How do you feel today?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ],
                ),

                // 4 faces
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        FloatingActionButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            TriageScreen.routeName,
                            arguments: <String, dynamic>{
                              'problem': Problem.Anxiety,
                            },
                          ),
                          child: Emoticons(
                            emoticons: "😰",
                          ),
                          backgroundColor: Colors.deepPurple[50],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Anxious',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.deepPurple[50],
                          onPressed: () => Navigator.pushNamed(
                            context,
                            TriageScreen.routeName,
                            arguments: <String, dynamic>{
                              'problem': Problem.Stress,
                            },
                          ),
                          child: Emoticons(
                            emoticons: "😫",
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Stressed',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FloatingActionButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            TriageScreen.routeName,
                            arguments: <String, dynamic>{
                              'problem': Problem.Depression,
                            },
                          ),
                          child: Emoticons(
                            emoticons: "😞",
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Depressed',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          // Exercise
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.grey[100],
            ),
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  // Exercise heading
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Steps Tracker',
                        style: TextStyle(
                            fontSize: Dimensions.height25,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),

                  SizedBox(height: Dimensions.height10),
                  Expanded(child: Stepcount()),
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
