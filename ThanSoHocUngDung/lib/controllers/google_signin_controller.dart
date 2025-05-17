import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  // Object
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  // function for login
  login() async {
    googleSignInAccount = await _googleSignIn.signIn();

    // call
    notifyListeners();
  }

  // function for logout
  logout() async {
    googleSignInAccount = await _googleSignIn.signOut();

    //call
    notifyListeners();
  }
}
