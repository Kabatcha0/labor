import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/smooth_indicator.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/login/login.dart';
import 'package:labor/shared/const.dart';
import 'package:labor/shared/network/local/local.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  PageController pageController = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding:
                const EdgeInsets.only(right: 12, left: 12, top: 20, bottom: 12),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    children: [pageViewOne(), pageViewTwo(), pageViewThree()],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SmoothIndicatorWidget(
                  pageController: pageController,
                  count: 3,
                  activeColor: Color(Const.indicator),
                  color: const Color.fromARGB(255, 185, 184, 184),
                  dotHeight: 9,
                  dotWidth: 9,
                  expansion: 3.5,
                  raduis: 5,
                  spacing: 7,
                  strokeWidth: 28,
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    if (index == 3) {
                      navigatorRemove(context: context, widget: Login());
                      CacheHelper.setData(key: "onBoard", value: true);
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
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
      listener: (context, state) {},
    );
  }

  Widget pageViewOne() {
    return Column(
      children: [
        SizedBox(
          height: 299,
          width: 299,
          child: Image.asset("assets/onBoarding1.png"),
        ),
        const SizedBox(
          height: 15,
        ),
        Builder(builder: (context) {
          index = 1;
          return Text(
            "Easy Process",
            style: TextStyle(
                fontFamily: "Quicksand",
                color: Colors.black,
                fontSize: Const.fontFive,
                fontWeight: FontWeight.bold),
          );
        }),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Find all your house needs in one place.\nWe provide every service to make your\nhome experience smooth.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Quicksand",
              color: Colors.grey[400],
              fontSize: Const.fontTwo,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget pageViewTwo() {
    return Column(
      children: [
        SizedBox(
          height: 275,
          width: 310,
          child: Image.asset("assets/onBoarding2.png"),
        ),
        const SizedBox(
          height: 15,
        ),
        Builder(builder: (context) {
          index = 2;
          return Text(
            "Expert People",
            style: TextStyle(
                fontFamily: "Quicksand",
                color: Colors.black,
                fontSize: Const.fontFive,
                fontWeight: FontWeight.bold),
          );
        }),
        const SizedBox(
          height: 10,
        ),
        Text(
          "We have the best in class individuals working just for you.\nThey are well trained and capable of handling\nanything you need.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Quicksand",
              color: Colors.grey[400],
              fontSize: Const.fontTwo,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget pageViewThree() {
    return Column(
      children: [
        SizedBox(
          height: 275,
          width: 310,
          child: Image.asset("assets/onBoarding3.png"),
        ),
        const SizedBox(
          height: 15,
        ),
        Builder(builder: (context) {
          index = 3;
          log("$index");
          return Text(
            "All In One Place",
            style: TextStyle(
                fontFamily: "Quicksand",
                color: Colors.black,
                fontSize: Const.fontFive,
                fontWeight: FontWeight.bold),
          );
        }),
        const SizedBox(
          height: 10,
        ),
        Text(
          "We have all the household services\nyou need on a daily basis with\neasy access.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Quicksand",
              color: Colors.grey[400],
              fontSize: Const.fontTwo,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
