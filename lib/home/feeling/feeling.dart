import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindswells/auth/signup_components/body.dart';
// import 'package:mindswells/home/feeling/screens/checkBack.dart';
import 'package:mindswells/home/feeling/screens/schedule.dart';
import 'package:mindswells/home/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import './screens/review.dart';
import './screens/reward.dart';
import './screens/triage.dart';
import './screens/challenge.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import './providers/challenges.dart';
import './providers/rewards.dart';
import './providers/tasks.dart';

import './constants.dart';
import './database/database.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails? notificationAppLaunchDetails;

class FeelingPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _FeelingPageState createState() => _FeelingPageState();
}

class _FeelingPageState extends State<FeelingPage> {
  var _isInit = true;
  bool _isDatabaseInitialized = false;
  // late Database _database;

  late Database _database;
  Future<void> initializeDatabase() async {
    try {
      final database = await connectToDB(DB_NAME);
      setState(() {
        _database = database;
        _isDatabaseInitialized = true;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDatabase(); // Initialize the database in initState
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      connectToDB(DB_NAME).then((database) {
        _database = database;
      }).catchError((err) {
        print(err);
      }).whenComplete(() {
        setState(() {
          _isInit = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isDatabaseInitialized) {
      // Handle the case where the database is not yet initialized.
      // You might want to show a loading spinner or an error message.
      return CircularProgressIndicator(); // For example
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Tasks(_database)),
        ChangeNotifierProvider(create: (_) => Rewards(_database)),
        ChangeNotifierProvider(create: (_) => Challenges(_database)),
      ],
      child: Consumer<Challenges>(builder: (context, challenges, _) {
        return MaterialApp(
          title: 'Uday',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            hintColor: kAccentColor,
            textTheme: GoogleFonts.quicksandTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          // debugShowCheckedModeBanner: false,
          home: MainScreen(),
          routes: {
            MainScreen.routeName: (ctx) => MainScreen(),
            ScheduleScreen.routeName: (ctx) =>
                ScheduleScreen(scheduleNotification),
            TriageScreen.routeName: (ctx) => TriageScreen(),
            ChallengeScreen.routeName: (ctx) => ChallengeScreen(),
            RewardScreen.routeName: (ctx) => RewardScreen(),
            ReviewScreen.routeName: (ctx) => ReviewScreen(),
          },
        );
      }),
    );
  }
}

Future initializeTimeZone() async {
  tz.initializeTimeZones();
}

Future<void> scheduleNotification(
    DateTime scheduledTime, String title, String description) async {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'uday_id',
    'uday',
  );

  final platformSpecifics =
      NotificationDetails(android: androidChannelSpecifics);
  await initializeTimeZone();
  var time = tz.TZDateTime.from(
    scheduledTime,
    tz.local,
  );

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    title,
    description,
    time,
    platformSpecifics,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    androidAllowWhileIdle: true,
  );
}
