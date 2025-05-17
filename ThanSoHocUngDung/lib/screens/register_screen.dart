import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thansohocungdung/const.dart';
import 'package:thansohocungdung/screens/forgot_password_screen.dart';
import 'package:thansohocungdung/screens/login_screen.dart';
import 'package:thansohocungdung/screens/submit_dob_name_screen.dart';
import 'package:thansohocungdung/screens/terrns_and_conditions_screen.dart';
import 'package:thansohocungdung/templates/base_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  static const String screenName = 'register_screen';

  final _auth = FirebaseAuth.instance; // tao mot object authFireBase
  String email = '';
  String password = '';

  final GoogleSignIn? ggSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await ggSignIn?.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        return user;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> _handleSignOut() async {
    try {
      await ggSignIn?.signOut();
      await _auth.signOut();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      children: <Widget>[
        Container(
          color: Color(0xff1E2227),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  label: Text('Continue with Facebook'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF1776F5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final User? user = await _handleSignIn();
                    if (user != null) {
                      // Đăng nhập thành công
                      print('Đăng nhập thành công: ${user.displayName}');
                    } else {
                      // Đăng nhập thất bại
                      print('Đăng nhập thất bại');
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.google),
                  label: Text('Continue with Google'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFFE74133),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Divider(
                        color: Color(0xFF777777),
                        height: 36,
                      ),
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      color: Color(0xFF777777),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Divider(
                        color: Color(0xFF777777),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Color(0xff63717e),
                    ),
                    children: [
                      TextSpan(
                        text: 'By logging in, you agree our ',
                      ),
                      TextSpan(
                          text: 'terms and conditions.',
                          style: TextStyle(
                            color: Color(0xff0d7070),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle the tap event
                              Navigator.pushNamed(context, TermsAndConditionsScreen.screenName);
                            }),
                    ]),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // print(email);
                    // print(password);
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, SubmitDobNameScreen.screenName);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0d7070),
                  ),
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Color(0xff63717e)),
                children: [
                  TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, LoginScreen.screenName);
                        }),
                  TextSpan(text: ' | '),
                  TextSpan(
                      text: 'Forgot your password',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, ForgotPasswordScreen.screenName);
                        }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
