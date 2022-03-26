import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class SubmitButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  SubmitButton({required this.onTap, required this.text});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: AnimatedContainer(
          height: 90.0,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Center(
            child: Text(
              widget.text,
              style: kButtonText,
            ),
          ),
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
