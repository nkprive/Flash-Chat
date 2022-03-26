import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../ui/background_image_wrapper.dart';
import '../ui/bottom_head_character.dart';
import '../ui/head_character.dart';
import '../ui/login_button.dart';
import '../ui/register_button.dart';
import '../utilities/constants.dart';
import '../utilities/enums.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  double opacity = 1;
  Color textColor = Colors.green;

  @override
  void initState() {
    super.initState();
    // controller =
    //     AnimationController(duration: Duration(seconds: 1), vsync: this);
    //
    // animation = ColorTween(begin: Color(0xFF4EADAF), end: Colors.black)
    //     .animate(controller);
    // controller.forward();
    //
    // controller.addListener(() {
    //   setState(() {
    //     print(animation.value);
    //     textColor = animation.value;
    //   });
    // });
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  HeadCharacterTransitionState headCharacterTransitionState =
      HeadCharacterTransitionState.welcome;

  void loginButtonTapped() {
    // update animated container values.
    Navigator.pushNamed(context, LoginScreen.route);
  }

  void registerButtonTapped() {
    // update animated container values.
    Navigator.pushNamed(context, RegistrationScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWrapper(
      image: AssetImage("images/social_icon_background_shade_1.png"),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
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
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Flash Chat',
                            textAlign: TextAlign.center,
                            textStyle: kWelcomeTitleStyle,
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        totalRepeatCount: 4,
                        pause: const Duration(milliseconds: 3000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                HeadCharacter(
                  transitionState: headCharacterTransitionState,
                ),
                SizedBox(
                  height: 20.0,
                ),
                LoginButton(onTap: loginButtonTapped),
                SizedBox(
                  height: 15.0,
                ),
                RegisterButton(onTap: registerButtonTapped),
                SizedBox(
                  height: 20.0,
                ),
                BottomHeadCharacter(),
                Expanded(
                  child: SizedBox.shrink(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
