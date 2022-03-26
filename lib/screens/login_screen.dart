import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../ui/background_image_wrapper.dart';
import '../ui/head_character.dart';
import '../ui/submit_button.dart';
import '../ui/user_creds_form_field.dart';
import '../utilities/enums.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  HeadCharacterTransitionState headCharacterTransitionState =
      HeadCharacterTransitionState.login;

  final _auth = FirebaseAuth.instance;

  bool _authenticating = false;

  String username = '';
  String password = '';

  void submit() async {
    setState(() {
      _authenticating = true;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: username, password: password);

      if (userCredential != null) {
        setState(() {
          _authenticating = false;
        });
        // progress?.dismiss();
        Navigator.pushNamed(context, ChatScreen.route);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _authenticating = false;
      });
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void usernameChanged(value) {
    username = value;
  }

  void passwordChanged(value) {
    password = value;
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWrapper(
      image: AssetImage("images/social_icon_background_shade_1.png"),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ModalProgressHUD(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          color: Colors.white,
                          child: Text(
                            'Flash Chat_',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 38.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'krungthep',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Hero(
                      tag: 'top_shape',
                      child: HeadCharacter(
                        transitionState: headCharacterTransitionState,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    UserCredsFormField(
                      type: InputFieldType.username,
                      onChanged: usernameChanged,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    UserCredsFormField(
                      type: InputFieldType.password,
                      onChanged: passwordChanged,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Hero(
                      tag: 'bottom_shape',
                      child: SubmitButton(
                        text: 'Log In',
                        onTap: submit,
                      ),
                    ),
                    Expanded(child: SizedBox.shrink())
                  ],
                ),
              ),
            ),
            inAsyncCall: _authenticating),
      ),
    );
  }
}
