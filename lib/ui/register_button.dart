import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class RegisterButton extends StatefulWidget {
  final VoidCallback onTap;
  const RegisterButton({required this.onTap});

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  double width = 330;
  double height = 90;

  Radius topLeftRadius = Radius.circular(5);
  Radius topRightRadius = Radius.circular(30);
  Radius bottomLeftRadius = Radius.circular(30);
  Radius bottomRightRadius = Radius.circular(30);

  Border border = Border.all(style: BorderStyle.none);

  Text text = Text(
    'Register',
    style: kButtonText.copyWith(color: kGreenAccent),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          height: height,
          width: width,
          child: Center(child: text),
          decoration: BoxDecoration(
            border: border,
            boxShadow: kBoxShadow,
            borderRadius: BorderRadius.only(
              topLeft: topLeftRadius,
              topRight: topRightRadius,
              bottomLeft: bottomLeftRadius,
              bottomRight: bottomRightRadius,
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
