import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class LoginButton extends StatefulWidget {
  final VoidCallback onTap;

  const LoginButton({required this.onTap});

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  double width = 330;
  double height = 90;

  Radius topLeftRadius = Radius.circular(30);
  Radius topRightRadius = Radius.circular(5);
  Radius bottomLeftRadius = Radius.circular(30);
  Radius bottomRightRadius = Radius.circular(30);

  Border border = Border.all(style: BorderStyle.none);

  List<Color> gradientColors = [kGreenAccent, Color(0xFF55B7B9)];

  Text text = Text(
    'Login',
    style: kButtonText.copyWith(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerRight,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          height: height,
          width: width,
          child: Center(child: text),
          decoration: BoxDecoration(
            boxShadow: kBoxShadow,
            border: border,
            borderRadius: BorderRadius.only(
              topLeft: topLeftRadius,
              topRight: topRightRadius,
              bottomLeft: bottomLeftRadius,
              bottomRight: bottomRightRadius,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
        ),
      ),
    );
  }
}
