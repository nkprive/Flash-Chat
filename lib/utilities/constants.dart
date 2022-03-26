import 'package:flutter/material.dart';

import 'enums.dart';

const kWelcomeTitleStyle = TextStyle(
  fontSize: 38.0,
  color: Colors.black,
  fontWeight: FontWeight.w900,
  fontFamily: 'krungthep',
);
const kGreenAccent = Color(0xFF4EADAF);
const kGreyTextboxBorder = Color(0xFFC1C1C1);
const kButtonText = TextStyle(
  fontFamily: 'krungthep',
  fontSize: 30.0,
);

const kMessageBoxSenderTextStyle = TextStyle(
  color: Color(0xff9A9A9A),
  fontWeight: FontWeight.bold,
  fontSize: 13.0,
  fontFamily: 'krungthep',
);

const kMessageBoxText = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 18.0,
  fontFamily: 'krungthep',
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kFormFieldSuggestionTextStyle = TextStyle(
  color: Color(0xFFD6D6D6),
  fontSize: 25.0,
  fontFamily: 'krungthep',
);
const kFormFieldTextStyle = TextStyle(
  color: Color(0xFF244A80),
  fontSize: 25.0,
  fontFamily: 'krungthep',
);

const kMessageBoxHintStyle = TextStyle(
  color: Color(0xFFD6D6D6),
  fontSize: 18.0,
  fontFamily: 'krungthep',
);

const kMessageBoxStyle = TextStyle(
  color: Color(0xFF244A80),
  fontSize: 20.0,
  fontFamily: 'krungthep',
);

const kSendButtonStyle = TextStyle(
  color: Color(0xFF4DADAF),
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'krungthep',
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    spreadRadius: 1,
    blurRadius: 7,
    offset: Offset(0, 2), // changes position of shadow
  ),
];

const List<Map<String, dynamic>> chat_history = [
  {
    "sender": "pilli@live.nl",
    "message": "Yo Yo wzupp",
    "origin": MessageOrigin.foreign
  },
  {
    "sender": "john@gmail.com",
    "message": "Hey I'd like to say im of today.",
    "origin": MessageOrigin.foreign
  },
  {
    "sender": "nkprive@mgail.com",
    "message": "Eww, you always say you're of today.",
    "origin": MessageOrigin.self
  },
  {
    "sender": "john@gmail.com",
    "message": "ehh.. nevermind.",
    "origin": MessageOrigin.foreign
  },
  {
    "sender": "pilli@live.nl",
    "message": "Its all good bro.",
    "origin": MessageOrigin.foreign
  },
  {
    "sender": "nkprive@mgail.com",
    "message": "Haha oh for real? me 2!",
    "origin": MessageOrigin.self
  },
  {
    "sender": "nkprive@mgail.com",
    "message": "Beer at my place then?",
    "origin": MessageOrigin.self
  },
  {
    "sender": "john@gmail.com",
    "message": "Hell yea dudes!!",
    "origin": MessageOrigin.foreign
  },
];
