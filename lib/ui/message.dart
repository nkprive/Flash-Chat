import 'package:flash_chat/utilities/enums.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class Message extends StatelessWidget {
  final String text;
  final String sender;
  final Enum origin;

  const Message(
      {required this.text, required this.origin, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: origin == MessageOrigin.foreign
          ? EdgeInsets.only(right: 30.0, bottom: 10.0)
          : EdgeInsets.only(left: 30.0, bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: origin == MessageOrigin.foreign
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
            child: Text(
              sender,
              style: kMessageBoxSenderTextStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color:
                  origin == MessageOrigin.foreign ? Colors.white : kGreenAccent,
              boxShadow: kBoxShadow,
              borderRadius: BorderRadius.only(
                topLeft: origin == MessageOrigin.foreign
                    ? Radius.circular(5.0)
                    : Radius.circular(20.0),
                topRight: origin == MessageOrigin.foreign
                    ? Radius.circular(20.0)
                    : Radius.circular(5.0),
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
            child: Text(
              text,
              style: kMessageBoxText.copyWith(
                  color: origin == MessageOrigin.foreign
                      ? kGreenAccent
                      : Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
