import 'package:flutter/material.dart';

class ColonBlock extends StatelessWidget {
  final double fontSize;
  final double height;
  const ColonBlock({super.key, required this.fontSize, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fontSize * 0.9,
      height: height,
      child: Center(
        child: Text(
          ':',
          style: TextStyle(
            color: Color(0xff333333),
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
