import 'package:flutter/material.dart';
import '../constants.dart';

class CustomActionButton extends StatelessWidget {
  final void Function() onPressed;
  final String action;

  CustomActionButton({
    required this.action,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        textStyle: MaterialStateProperty.all(kBodyStyle),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Text(action),
    );
  }
}
