import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.deepPurpleAccent.shade100,
      textColor: Colors.white,
      child: Text(text),
       shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Colors.deepPurpleAccent.shade100,
    ),
    borderRadius: BorderRadius.circular(20.0),
  ),
    );
  }
}
