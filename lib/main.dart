import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

// void main() => runApp(FlashChat());

// Add async/await and 2 lines of code to the main function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: WelcomeScreen.route,
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          WelcomeScreen.route: (context) => WelcomeScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          LoginScreen.route: (context) => LoginScreen(),
          RegistrationScreen.route: (context) => RegistrationScreen(),
          ChatScreen.route: (context) => ChatScreen(),
        }
        // home: WelcomeScreen()
        // child: WelcomeScreen(),
        );
  }
}
