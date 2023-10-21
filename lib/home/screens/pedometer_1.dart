import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Stepcount extends StatefulWidget {
  const Stepcount({Key? key}) : super(key: key);

  @override
  _StepcountState createState() => _StepcountState();
}

class _StepcountState extends State<Stepcount> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  int _initialStepCount = 0;
  int _steps = 0;
  String _stepsPercent = '0.00%'; // Initialize with two decimal places
  String _distance = '0.0';
  String _calories = '0.0';

  String formatDate(DateTime d) {
    return d.toString().substring(0, 19);
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
    initPlatformState();
    checkPermission();
  }

  void calculateMiles(int steps) {
    double dist = steps / 2500;
    setState(() {
      _distance = dist.toStringAsFixed(2);
    });
  }

  void calculateCalories(int steps) {
    double caloriesCount = 0.04 * steps;
    setState(() {
      _calories = caloriesCount.toStringAsFixed(2);
    });
  }

  void onStepCount(StepCount event) {
    int currentStepCount = event.steps;
    setState(() {
      // Calculate the actual step count based on the initial count
      if (_initialStepCount == 0) {
        _initialStepCount = currentStepCount;
      }
      _steps = currentStepCount - _initialStepCount;
      _stepsPercent = (_steps / 10000 * 100).toStringAsFixed(2) + '%';
      calculateMiles(_steps);
      calculateCalories(_steps);
    });
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
      _steps = 0;
      _initialStepCount = 0;
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
              percent: double.parse(_stepsPercent.replaceAll('%', '')) / 100,
              animation: true,
              center: Text("$_stepsPercent",
                  style: TextStyle(fontSize: 30, color: Colors.deepPurple)),
              progressColor: Colors.deepPurple,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Steps taken: $_steps',
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
                                color: Colors.deepPurple),
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
                            "$_calories",
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
                              shape: BoxShape.circle, color: Colors.deepPurple),
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
                          "$_distance",
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
