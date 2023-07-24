import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:labor/shared/const.dart';

class NotificationWidget extends StatelessWidget {
  bool complete;
  String assetName;
  String text;
  String textTwo;
  String hour;

  NotificationWidget(
      {required this.complete,
      required this.assetName,
      required this.text,
      required this.textTwo,
      required this.hour});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: complete ? 156 : 96,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(assetName),
                  ),
                  // CircleAvatar(
                  //   radius: 20,
                  //   backgroundImage: AssetImage(assetName),
                  // ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text,
                            style: TextStyle(
                                fontSize: Const.fontEight,
                                fontFamily: "Quicksand",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            hour,
                            style: TextStyle(
                                fontSize: Const.fontSex,
                                fontFamily: "Quicksand",
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
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
                  )),
                ],
              ),
              if (complete) ...[
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Complete payment methods",
                      style: TextStyle(
                          fontSize: Const.fontSex,
                          fontFamily: "Quicksand",
                          color: Color(Const.scaffoldColors),
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(Const.scaffoldColors),
                      size: 25,
                    )
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
