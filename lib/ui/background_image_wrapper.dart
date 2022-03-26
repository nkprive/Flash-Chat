import 'package:flutter/material.dart';

class BackgroundImageWrapper extends StatelessWidget {
  final Widget child;
  final AssetImage image;
  BackgroundImageWrapper({required this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: image,
            repeat: ImageRepeat.repeat,
            fit: BoxFit.scaleDown,
          ),
        ),
        child: child);
  }
}
