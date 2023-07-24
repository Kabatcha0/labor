import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:labor/shared/const.dart';

class SelectAddressWidget extends StatelessWidget {
  Color color;
  String city;
  String region;
  String building;
  String street;
  bool check;
  SelectAddressWidget(
      {required this.color,
      required this.building,
      required this.city,
      required this.check,
      required this.region,
      required this.street});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 124,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor:
                  check ? Colors.white : Color(Const.scaffoldColors),
              child: Icon(
                Icons.pin_drop_rounded,
                color: check ? Color(Const.indicator) : Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "City",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Const.fontTen,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          city,
                          style: TextStyle(
                              color: check ? Colors.white : Colors.black,
                              fontSize: Const.fontSex,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Street",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Const.fontTen,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          street,
                          style: TextStyle(
                              color: check ? Colors.white : Colors.black,
                              fontSize: Const.fontSex,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Region",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Const.fontTen,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          region,
                          style: TextStyle(
                              color: check ? Colors.white : Colors.black,
                              fontSize: Const.fontSex,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Building",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Const.fontTen,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          building,
                          style: TextStyle(
                              color: check ? Colors.white : Colors.black,
                              fontSize: Const.fontSex,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand"),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
