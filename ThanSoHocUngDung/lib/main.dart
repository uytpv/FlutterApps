import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:thansohocungdung/screens/home_screen.dart';
import 'package:thansohocungdung/screens/login_screen.dart';
import 'package:thansohocungdung/screens/register_screen.dart';
import 'package:thansohocungdung/screens/submit_dob_name_screen.dart';
import 'package:thansohocungdung/screens/terrns_and_conditions_screen.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Check if Firebase App is already initialized
  if (Firebase.apps.isEmpty) {
    // Initialize Firebase
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBViczjWgc4GZxjSBNNf-fC0FkelV0Ouck',
        appId: '1:530698299938:android:fbe6568bd42e236659b87b',
        messagingSenderId: '530698299938',
        projectId: 'thansohocungdung-1e2c5',
      ),
    );
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.screenName,
      routes: {
        HomeScreen.screenName: (context) => HomeScreen(),
        LoginScreen.screenName: (context) => LoginScreen(),
        RegisterScreen.screenName: (context) => RegisterScreen(),
        TermsAndConditionsScreen.screenName: (context) => TermsAndConditionsScreen(),
        SubmitDobNameScreen.screenName: (context) => SubmitDobNameScreen(),
      },
    );
  }
}
