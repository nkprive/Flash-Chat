import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../ui/background_image_wrapper.dart';
import '../ui/head_character.dart';
import '../ui/submit_button.dart';
import '../ui/user_creds_form_field.dart';
import '../utilities/enums.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  HeadCharacterTransitionState headCharacterTransitionState =
      HeadCharacterTransitionState.login;

  String username = '';
  String password_1 = '';
  String password_2 = '';

  bool _authenticating = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  void submit() async {
    setState(() {
      _authenticating = true;
    });

    if (password_1 == password_2) {
      try {
        final user = await _auth.createUserWithEmailAndPassword(
            email: username, password: password_1);

        if (user != null) {
          Navigator.pushNamed(context, ChatScreen.route);
        }
      } catch (e) {
        setState(() {
          _authenticating = false;
        });
        print(e);
      }
    }
    setState(() {
      _authenticating = false;
    });
  }

  void usernameChanged(value) {
    username = value;
  }

  void password1Changed(value) {
    password_1 = value;
  }

  void password2Changed(value) {
    password_2 = value;
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
                    Flexible(
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
                    Flexible(
                      child: Hero(
                          tag: 'top_shape',
                          child: HeadCharacter(
                              transitionState: headCharacterTransitionState)),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    UserCredsFormField(
                      type: InputFieldType.username,
                      onChanged: this.usernameChanged,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    UserCredsFormField(
                      type: InputFieldType.password,
                      onChanged: this.password1Changed,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    UserCredsFormField(
                      type: InputFieldType.password,
                      onChanged: this.password2Changed,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Hero(
                      tag: 'bottom_shape',
                      child: SubmitButton(
                        text: 'Register',
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
