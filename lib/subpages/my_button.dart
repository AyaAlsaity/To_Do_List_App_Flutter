import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
      // ignore: sort_child_properties_last
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
