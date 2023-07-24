import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePageButton extends StatelessWidget {
  Color color;
  String text;
  double font;
  WelcomePageButton({
    required this.color,
    required this.text,
    required this.font,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: AlignmentDirectional.center,
      height: 60,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Text(text,
          style: TextStyle(
              fontFamily: "Quicksand",
              fontSize: font,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }
}
