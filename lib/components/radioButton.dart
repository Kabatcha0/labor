import 'package:flutter/material.dart';

import 'package:labor/shared/const.dart';

class RadioButton extends StatefulWidget {
  String text;
  String current;
  String value;
  Function(String?)? function;
  RadioButton(
      {required this.text,
      required this.current,
      required this.value,
      required this.function});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  // List<String> select = ["English", "Arabic"];

  @override
  Widget build(BuildContext context) {
    // String current = select[0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: TextStyle(
              fontFamily: "Quicksand",
              fontSize: Const.fontTwo,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        Radio(
            activeColor: Color(Const.scaffoldColors),
            value: widget.value,
            groupValue: widget.current,
            onChanged: widget.function)
      ],
    );
  }
}
