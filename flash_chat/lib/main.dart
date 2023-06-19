import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Check if Firebase App is already initialized
  if (Firebase.apps.isEmpty) {
    // Initialize Firebase
    Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBMrTCh0A2Pdf2R1ycgAAmU4AvOQCoJHVw',
        appId: '1:506854374215:android:4bed964d54b56b1f322a62',
        messagingSenderId: '506854374215',
        projectId: 'amunselect-flash-chat',
      ),
    );
  }
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
