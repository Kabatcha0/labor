import 'package:flutter/material.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/modules/add_card/add_card.dart';
import 'package:labor/shared/const.dart';

class OurServices extends StatelessWidget {
  String image;
  String text;
  OurServices({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171,
      height: 193,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 89,
                width: 89,
                child: Image.asset(image),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Const.fontThree,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quicksand"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
