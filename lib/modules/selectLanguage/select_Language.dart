import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/radioButton.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/onBoarding/onBoarding.dart';
import 'package:labor/shared/const.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  List<String> select = ["English", "Arabic"];
  String? current;
  @override
  void initState() {
    current = select[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaborCubit.get(context);

        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 139,
                  width: 139,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(Const.scaffoldColors)),
                  child: Image.asset(
                    "assets/splash.png",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Find your \nhome service",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      color: Colors.black,
                      fontSize: Const.fontFour),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "select language",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Const.fontOne),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    RadioButton(
                      text: "English",
                      current: current!,
                      function: (value) {
                        setState(() {
                          current = value.toString();
                          log(current!);
                        });
                      },
                      value: select[0],
                    ),
                    RadioButton(
                      text: "Arabic",
                      current: current!,
                      function: (value) {
                        setState(() {
                          log("message");
                          current = value.toString();
                          log(current!);
                        });
                      },
                      value: select[1],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: "By creating an account, you agree to our\n",
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Colors.black,
                          fontSize: Const.fontSex),
                      children: [
                        TextSpan(
                            text: "Term and Conditions",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                color: Color(Const.scaffoldColors),
                                fontSize: Const.fontSex))
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    navigator(context: context, widget: OnBoarding());
                  },
                  child: WelcomePageButton(
                      color: Color(Const.scaffoldColors),
                      text: "Enter",
                      font: Const.fontThree),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
