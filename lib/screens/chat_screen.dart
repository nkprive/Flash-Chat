import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../ui/background_image_wrapper.dart';
import '../ui/message.dart';
import '../utilities/enums.dart';

class ChatScreen extends StatefulWidget {
  static const String route = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final textfieldController = TextEditingController();

  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // getMessages();
    messagesStream();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textfieldController.dispose();
    super.dispose();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser);
      }
    } catch (e) {
      print(e);
    }
  }

  void sendMessage() async {
    await _firestore.collection('messages').add(
      {
        'created_at': DateTime.now(),
        'sender': loggedInUser?.email,
        'text': textfieldController.text,
      },
    );
    textfieldController.clear();
  }

  /* we let this method listen for the "stream of messages"
    coming over from firebase */
  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWrapper(
      image: AssetImage("images/social_icon_background_shade_1.png"),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Hero(
              tag: 'top_shape',
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kGreenAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                child: DelayedDisplay(
                  delay: Duration(milliseconds: 150),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(''),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, right: 15.0),
                        child: IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () {
                            _auth.signOut();
                            Navigator.pushNamed(context, WelcomeScreen.route);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('messages')
                      .orderBy('created_at', descending: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      QuerySnapshot fireStoreSnapshot =
                          snapshot.data as QuerySnapshot;

                      return ListView.builder(
                        padding: EdgeInsets.only(top: 33.0, bottom: 20.0),
                        itemCount: fireStoreSnapshot.docs.length,
                        itemBuilder: (context, index) {
                          var message = fireStoreSnapshot.docs[index];
                          return Message(
                            text: message['text'],
                            sender: message['sender'],
                            origin:
                                message['sender'] == _auth.currentUser?.email
                                    ? MessageOrigin.self
                                    : MessageOrigin.foreign,
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightGreenAccent,
                      ),
                    );
                  },
                ),
              ),
            ),
            Hero(
              tag: 'bottom_shape',
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(color: kGreenAccent, width: 4.0),
                    top: BorderSide(color: kGreenAccent, width: 4.0),
                    right: BorderSide(color: kGreenAccent, width: 4.0),
                    bottom: BorderSide(color: kGreenAccent, width: 4.0),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(48.0),
                    bottomRight: Radius.circular(48.0),
                  ),
                ),
                child: DelayedDisplay(
                  delay: Duration(milliseconds: 150),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 5.0,
                          ),
                          child: TextField(
                            controller: textfieldController,
                            minLines: 1,
                            maxLines:
                                5, // allow user to enter 5 line in textfield
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.center,
                            // focusNode: _focus,
                            // controller: textFieldController,
                            textAlign: TextAlign.left,
                            obscureText: false,
                            style: kMessageBoxStyle,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type your message here..',
                              hintStyle: kMessageBoxHintStyle,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TextButton(
                          onPressed: () {
                            sendMessage();
                          },
                          child: Text(
                            'SEND',
                            style: kSendButtonStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
