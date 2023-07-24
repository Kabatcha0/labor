import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:labor/shared/const.dart';

class PageViewWidget extends StatelessWidget {
  String step;
  String circle;
  Color color;
  Color backgroundColor;

  PageViewWidget({
    required this.circle,
    required this.step,
    required this.color,
    required this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 15,
          child: Text(
            circle,
            style: TextStyle(
                color: color,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
                fontSize: Const.fontSex),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          step,
          style: TextStyle(
              color: backgroundColor,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
              fontSize: Const.fontSex),
        )
      ],
    );
  }
}
