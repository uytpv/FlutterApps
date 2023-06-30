import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    required this.label,
    required this.colour,
    required this.onPressed,
  });

  String label;
  Color colour;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
