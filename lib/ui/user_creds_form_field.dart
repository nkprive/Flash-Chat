import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/enums.dart';

class UserCredsFormField extends StatefulWidget {
  final InputFieldType type;
  final Function onChanged;

  const UserCredsFormField({required this.type, required this.onChanged});

  @override
  _UserCredsFormFieldState createState() => _UserCredsFormFieldState();
}

class _UserCredsFormFieldState extends State<UserCredsFormField> {
  bool has_focus = false;
  bool has_content = false;

  FocusNode _focus = FocusNode();
  final textFieldController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _focus.removeListener(setFocus);
    textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _focus.addListener(setFocus);
    textFieldController.addListener(handleTextfieldChange);
  }

  void setFocus() {
    setState(() {
      has_focus = _focus.hasFocus;
    });
  }

  void handleTextfieldChange() {
    setState(() {
      has_content = textFieldController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              focusNode: _focus,
              controller: textFieldController,
              textAlign: TextAlign.center,
              obscureText:
                  widget.type == InputFieldType.password ? true : false,
              style: kFormFieldTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.type == InputFieldType.username
                    ? 'Enter your email'
                    : 'Enter your password',
                hintStyle: kFormFieldSuggestionTextStyle,
              ),
              onChanged: (value) {
                widget.onChanged(value);
              },
            ),
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: kBoxShadow,
          color: Colors.white,
          border: Border.all(
              color:
                  has_focus || has_content ? kGreenAccent : kGreyTextboxBorder,
              width: 5.0),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
