import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
var loggedInUser;

class SubmitDobNameScreen extends StatefulWidget {
  static const String screenName = 'submit_dob_name_screen';

  @override
  State<SubmitDobNameScreen> createState() => _SubmitDobNameScreenState();
}

class _SubmitDobNameScreenState extends State<SubmitDobNameScreen> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('SubmitDobNameScreen'),
    );
  }
}
