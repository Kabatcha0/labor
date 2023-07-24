import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:labor/shared/const.dart';

class ListTileWidget extends StatelessWidget {
  IconData icon;
  Widget widget;
  String text;
  String textTwo;
  bool column = true;
  Function() onTap;
  ListTileWidget(
      {required this.icon,
      required this.widget,
      required this.onTap,
      required this.text,
      required this.column,
      required this.textTwo});

  @override
  Widget build(BuildContext context) {
    return column
        ? GestureDetector(
            onTap: onTap,
            child: ListTile(
                leading: Icon(
                  icon,
                  size: 27,
                  color: Colors.grey,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: Const.fontTwo,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      textTwo,
                      style: TextStyle(
                          fontSize: Const.fontEight,
                          fontFamily: "Quicksand",
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                trailing: widget),
          )
        : ListTile(
            leading: Icon(
              icon,
              size: 27,
              color: Colors.grey,
            ),
            title: Text(
              text,
              style: TextStyle(
                  fontSize: Const.fontTwo,
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            trailing: widget);
  }
}
