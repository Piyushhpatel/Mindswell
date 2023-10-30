import 'package:flutter/material.dart';

class Emoticons extends StatelessWidget {
  final String emoticons;
  const Emoticons({Key? key, required this.emoticons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.black),
          color: Colors.deepPurpleAccent[400],
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        emoticons,
        style: TextStyle(
          fontSize: 28,
        ),
      )),
    );
  }
}
