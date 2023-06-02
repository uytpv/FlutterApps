import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090D22),
        scaffoldBackgroundColor: Color(0xFF090D22),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF090D22),
        ),
      ),
      home: InputPage(),
    );
  }
}


