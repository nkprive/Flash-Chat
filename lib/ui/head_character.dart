import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities/constants.dart';
import '../utilities/enums.dart';

class HeadCharacter extends StatefulWidget {
  final HeadCharacterTransitionState transitionState;

  HeadCharacter({required this.transitionState});
  @override
  _HeadCharacterState createState() => _HeadCharacterState();
}

class _HeadCharacterState extends State<HeadCharacter> {
  double width = 230;
  double height = 150;
  EdgeInsets containerPadding = EdgeInsets.only(left: 50.0);
  EdgeInsets eyePadding = EdgeInsets.only(top: 45.0);
  BorderRadius radius = BorderRadius.only(
    topLeft: Radius.circular(75),
    topRight: Radius.circular(75),
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    if (widget.transitionState == HeadCharacterTransitionState.welcome) {
      setState(() {
        width = 230;
        height = 150;
        containerPadding = EdgeInsets.only(left: 50.0);
        eyePadding = EdgeInsets.only(top: 45.0);
      });
    } else if (widget.transitionState == HeadCharacterTransitionState.login) {
      setState(() {
        width = MediaQuery.of(context).size.width;
        height = 90;
        containerPadding = EdgeInsets.all(0.0);
        eyePadding = EdgeInsets.only(top: 20.0);
      });
    }

    return Padding(
      padding: containerPadding,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.topCenter,
        // Define how long the animation should take.
        // duration: const Duration(seconds: 1),
        // // Provide an optional curve to make the animation feel smoother.
        // curve: Curves.fastOutSlowIn,
        child: Padding(
          padding: eyePadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('images/eye.svg', semanticsLabel: 'Acme Logo'),
              SizedBox(
                width: 70.0,
              ),
              SvgPicture.asset('images/eye.svg', semanticsLabel: 'Acme Logo'),
            ],
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: kBoxShadow,
          borderRadius: radius,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4EADAF),
              Color(0xFF55B7B9),
            ],
          ),
        ),
      ),
    );
  }
}
