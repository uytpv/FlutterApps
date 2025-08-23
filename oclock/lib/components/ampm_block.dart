import 'package:flutter/material.dart';

class AmPmBlock extends StatelessWidget {
  final bool isPM;
  final double height;
  const AmPmBlock({super.key, required this.isPM, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: height,
      child: Text(
        isPM ? 'PM' : 'AM',
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: height * 0.6,
          fontWeight: FontWeight.w700,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
