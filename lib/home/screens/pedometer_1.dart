import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Stepcount extends StatefulWidget {
  const Stepcount({Key? key}) : super(key: key);

  @override
  _StepcountState createState() => _StepcountState();
}

class StepData {
  int steps;
  double distance;
  double calories;

  StepData(
      {required this.steps, required this.distance, required this.calories});

  Map<String, dynamic> toJson() {
    return {
      'steps': steps,
      'distance': distance,
      'calories': calories,
    };
  }

  factory StepData.fromJson(Map<String, dynamic> json) {
    return StepData(
      steps: json['steps'],
      distance: json['distance'],
      calories: json['calories'],
    );
  }
}

class _StepcountState extends State<Stepcount> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  int _initialStepCount = 0;
  int _previousStepCount = 0; // Store the previous step count
  late StepData _stepData;
  late SharedPreferences _prefs;

  String formatDate(DateTime d) {
    return d.toString().substring(0, 10);
  }

  Future<void> checkPermission() async {
    var status = await Permission.activityRecognition.status;

    if (status.isDenied) {
      var activityPermissionStatus =
          await Permission.activityRecognition.request();

      if (activityPermissionStatus.isGranted) {
        // Permission has been granted. You can perform your activities here.
      } else {
        // Permission request was denied. You may want to handle this case.
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _stepData = StepData(steps: 0, distance: 0.0, calories: 0.0);
    initPlatformState();
    checkPermission();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    final currentDate = formatDate(DateTime.now());

    final jsonData = _prefs.getString('$currentDate.stepData');
    if (jsonData != null) {
      final data =
          StepData.fromJson(Map<String, dynamic>.from(json.decode(jsonData)));
      setState(() {
        _stepData = data;
      });
    } else {
      _stepData = StepData(steps: 0, distance: 0.0, calories: 0.0);
    }
  }

  void calculateMiles(int steps) {
    double dist = steps / 2500;
    setState(() {
      _stepData.distance = dist;
    });
  }

  void calculateCalories(int steps) {
    double caloriesCount = 0.04 * steps;
    setState(() {
      _stepData.calories = caloriesCount;
    });
  }

  void onStepCount(StepCount event) {
    int currentStepCount = event.steps;
    if (_initialStepCount == 0) {
      // Initial step count setup
      _initialStepCount = currentStepCount;
      _previousStepCount = currentStepCount;
    } else {
      // Calculate the actual steps based on the difference
      int steps = currentStepCount - _previousStepCount;
      _previousStepCount = currentStepCount;

      // Ensure that the steps are positive and reasonable
      if (steps > 0 && steps < 10) {
        _stepData.steps += steps;
        calculateMiles(_stepData.steps);
        calculateCalories(_stepData.steps);
        final currentDate = formatDate(DateTime.now());
        _prefs.setString(
            '$currentDate.stepData',
            json.encode(
                _stepData.toJson())); // Use json.encode to convert to JSON
      }
    }
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = '?';
    });
  }

  void onStepCountError(error) {
    setState(() {
      _stepData.steps = 0;
      _initialStepCount = 0;
      _previousStepCount = 0;
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 12.0,
              percent: _stepData.steps / 10000,
              animation: true,
              center: Text(
                '${(_stepData.steps / 10000 * 100).toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 30, color: Colors.deepPurple),
              ),
              progressColor: Colors.deepPurple,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Steps taken: ${_stepData.steps}',
              style: TextStyle(fontSize: 30),
            ),
            Divider(
              height: 10,
              thickness: 0,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurple,
                            ),
                            child: Icon(
                              Icons.local_fire_department_sharp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Calories",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            _stepData.calories.toStringAsFixed(2),
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Kcal",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurple,
                          ),
                          child: Icon(
                            FontAwesomeIcons.running,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Distance",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          _stepData.distance.toStringAsFixed(2),
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Miles",
                          style: TextStyle(fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
