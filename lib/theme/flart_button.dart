import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ShapeBorder shape;
  final Color color;
  final Color textColor;
  final EdgeInsets padding;

  const FlatButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.shape = const RoundedRectangleBorder(
      // borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.purple),
    ),
    this.color = Colors.white,
    this.textColor = Colors.purple,
    required this.padding,
    required Text child,
    // this.padding = EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: shape,
      color: color,
      textColor: textColor,
      padding: padding,
      onPressed: onPressed,
      text: 'Button',
      child: Text(text),
    );
  }
}
