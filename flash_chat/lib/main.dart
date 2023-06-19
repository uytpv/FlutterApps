import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(),
      ),
      initialRoute: WelcomeScreen.screenName,
      routes: {
        WelcomeScreen.screenName: (context) => WelcomeScreen(),
        LoginScreen.screenName: (context) => LoginScreen(),
        RegistrationScreen.screenName: (context) => RegistrationScreen(),
        ChatScreen.screenName: (context) => ChatScreen(),
      },
    );
  }
}