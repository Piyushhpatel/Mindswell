import 'package:flutter/material.dart';
// import '../constants.dart';

class BottomButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  BottomButton({
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 10.0),
        width: 80,
        // color: Colors.grey[200],
        height: 80.0,
        margin: EdgeInsets.all(30),
        // padding: EdgeInsets.all(30),
        // child: FloatingActionButton(
        //   onPressed: onPressed,
        //   child: Icon(Icons.arrow_forward_ios),
        //   style: ButtonStyle(
        //       backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
        // ),
        child: FloatingActionButton(
          onPressed: onPressed,
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
