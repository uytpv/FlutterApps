import 'package:flutter/material.dart';
import 'package:thansohocungdung/screens/login_screen.dart';
import 'package:thansohocungdung/screens/register_screen.dart';
import 'package:thansohocungdung/templates/base_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '';
  String password = '';
  String dob = '';
  String fullname = '';

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      children: <Widget>[
        Center(
          child: Text(
            'PROVIDE YOUR',
            style: TextStyle(
              fontFamily: 'Fredericka the Great',
              fontSize: 38,
              height: 1,
              color: Colors.white,
            ),
          ),
        ),
        Center(
          child: Text(
            'FULLNAME',
            style: TextStyle(
              fontFamily: 'Fredericka the Great',
              fontSize: 42,
              color: Colors.white,
              height: 1,
            ),
          ),
        ),
        Center(
          child: Text(
            'DATE OF BIRTH',
            style: TextStyle(
              fontFamily: 'Fredericka the Great',
              color: Colors.white,
              fontSize: 24,
              height: 1,
            ),
          ),
        ),
        Center(
          child: Text(
            'I WILL LET',
            style: TextStyle(
              fontFamily: 'Fredericka the Great',
              color: Colors.white,
              fontSize: 26,
              height: 1.2,
            ),
          ),
        ),
        Center(
          child: Text(
            'YOU',
            style: TextStyle(
              fontFamily: 'Fredericka the Great',
              color: Colors.white,
              fontSize: 50,
              height: 1,
            ),
          ),
        ),
        Center(
          child: Text(
            'KNOW',
            style: TextStyle(
              fontFamily: 'Fredericka the Great',
              color: Colors.white,
              fontSize: 20,
              height: 1,
            ),
          ),
        ),
        Center(
          child: Text(
            '!',
            style: TextStyle(
              fontFamily: 'Fredericka the Great',
              color: Colors.white,
              fontSize: 50,
              height: 1.2,
            ),
          ),
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 14, 174, 87),
                Color.fromARGB(255, 12, 116, 117),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RegisterScreen.screenName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            child: Text(
              'Get Started For Free',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}




