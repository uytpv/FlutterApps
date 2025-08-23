import 'package:flutter/material.dart';

class FlipBlock extends StatelessWidget {
  final String digit;
  final double width;
  final double height;
  final double fontSize;
  const FlipBlock(
      {super.key,
      required this.digit,
      required this.width,
      required this.height,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(width * 0.13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              digit,
              style: TextStyle(
                color: Color(0xffcccccc),
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                fontFamily: 'Roboto',
                letterSpacing: 2,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height / 2,
            child: Container(
              height: 5,
              color: Color(0xff292929),
              //color: Colors.yellowAccent,
            ),
          ),
        ],
      ),
    );
  }
}
