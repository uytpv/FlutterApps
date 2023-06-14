import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.cardChild, this.onPress});

  final Widget cardChild;
  // TODO dung VoidCallback testing
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF1D1F32),
            borderRadius: BorderRadius.circular(10),
          ),
          child: cardChild,
        ),
      ),
    );
  }
}
