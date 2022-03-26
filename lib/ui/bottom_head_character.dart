import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities/constants.dart';

class BottomHeadCharacter extends StatefulWidget {
  BottomHeadCharacter();
  @override
  _BottomHeadCharacterState createState() => _BottomHeadCharacterState();
}

class _BottomHeadCharacterState extends State<BottomHeadCharacter> {
  double width = 230;
  double height = 150;
  EdgeInsets padding = EdgeInsets.only(right: 50.0);
  Widget child = Padding(
    padding: const EdgeInsets.only(bottom: 45.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 2,
          child:
              SvgPicture.asset('images/eye.svg', semanticsLabel: 'Acme Logo'),
        ),
        SizedBox(
          width: 70.0,
        ),
        RotatedBox(
          quarterTurns: 2,
          child:
              SvgPicture.asset('images/eye.svg', semanticsLabel: 'Acme Logo'),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: AnimatedContainer(
          height: height,
          width: width,
          alignment: Alignment.bottomCenter,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: child,
          decoration: BoxDecoration(
            boxShadow: kBoxShadow,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(75),
              bottomRight: Radius.circular(75),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4EADAF), Color(0xFF55B7B9)],
            ),
          ),
        ),
      ),
    );
  }
}
