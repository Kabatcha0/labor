import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/pageViewWidget.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/layout/layout.dart';
import 'package:labor/shared/const.dart';

class Process extends StatelessWidget {
  String name;
  String image;
  PageController pageController = PageController();
  TextEditingController number = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController visits = TextEditingController();

  int indexPageView = 0;

  Process({required this.name, required this.image});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        int index = indexPageView;
        log("$index");
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                            name,
                            style: TextStyle(
                                fontSize: Const.fontNine,
                                fontFamily: "Quicksand",
                                fontWeight: FontWeight.bold,
                                color: Color(Const.scaffoldColors)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PageViewWidget(
                                  backgroundColor: index == 1 || index == 0
                                      ? Color(Const.scaffoldColors)
                                      : Colors.grey,
                                  circle: "1",
                                  step: "step 1",
                                  color: Colors.white),
                              const SizedBox(
                                width: 12,
                              ),
                              PageViewWidget(
                                  backgroundColor: index == 2
                                      ? Color(Const.scaffoldColors)
                                      : Colors.grey,
                                  circle: "2",
                                  step: "step 2",
                                  color: Colors.white),
                              const SizedBox(
                                width: 12,
                              ),
                              PageViewWidget(
                                  backgroundColor: index == 3
                                      ? Color(Const.scaffoldColors)
                                      : Colors.grey,
                                  circle: "3",
                                  step: "step 3",
                                  color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 117,
                        width: 117,
                        child: Image.asset(image),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: PageView(
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      pageOne(
                        change: cubit.change,
                        number: number,
                        nationality: nationality,
                        onTapMoon: () {
                          cubit.changeColorOfProcess();
                        },
                        onTapSun: () {
                          cubit.changeColorOfProcess();
                        },
                      ),
                      pageTwo(),
                      pageThree(
                          visits: visits,
                          context: context,
                          year: cubit.year,
                          days: cubit.days,
                          daysNum: cubit.daysOfNum,
                          hour: cubit.hour)
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (index == 3) {
                        navigator(context: context, widget: const Layout());
                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      }
                    },
                    child: WelcomePageButton(
                        color: Color(Const.scaffoldColors),
                        text: "Next",
                        font: Const.fontThree),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget process(
      {required bool change,
      required String image,
      required String text,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: change
                ? Border.all(color: Color(Const.indicator), width: 0.8)
                : null),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontTwo),
            )
          ],
        ),
      ),
    );
  }

  Widget pageOne({
    required bool change,
    required TextEditingController number,
    required TextEditingController nationality,
    required Function() onTapSun,
    required Function() onTapMoon,
  }) {
    return Builder(builder: (context) {
      indexPageView = 1;
      return Column(
        children: [
          Text(
            "Period",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Quicksand",
                fontSize: Const.fontTwo,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              process(
                  onTap: onTapSun,
                  change: !change,
                  image: "assets/sun.png",
                  text: "Morning"),
              process(
                  onTap: onTapMoon,
                  change: change,
                  image: "assets/night.png",
                  text: "Night"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFromFieldWidget(EvaIcons.arrowIosDownward,
              onTap: () {},
              maxLine: 1,
              text: "Number of Hour",
              hint: "4",
              textEditingController: number, validator: (v) {
            return "Please enter your Number of Hour";
          }, watch: true, textInputType: TextInputType.name),
          const SizedBox(
            height: 15,
          ),
          TextFromFieldWidget(EvaIcons.arrowIosDownward,
              onTap: () {},
              maxLine: 1,
              text: "Nationality",
              hint: "Egypt",
              textEditingController: nationality, validator: (v) {
            return "Please enter your Nationality";
          }, watch: true, textInputType: TextInputType.name),
          const SizedBox(
            height: 15,
          ),
          TextFromFieldWidget(EvaIcons.arrowIosDownward,
              onTap: () {},
              maxLine: 1,
              text: "City",
              hint: "Cairo",
              textEditingController: number, validator: (v) {
            return "Please enter your City";
          }, watch: true, textInputType: TextInputType.name),
        ],
      );
    });
  }

  Widget pageTwo() {
    return Builder(builder: (context) {
      indexPageView = 2;
      return Column(
        children: [
          Text(
            "Filter",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Quicksand",
                fontSize: Const.fontTwo,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Row(
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: Const.fontEight),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      EvaIcons.arrowIosDownward,
                      color: Colors.black,
                      size: 25,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Row(
                  children: [
                    Text(
                      "Evaluation",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: Const.fontEight),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      EvaIcons.arrowIosDownward,
                      color: Colors.black,
                      size: 25,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                segmentValue(
                    image: "assets/nile.png",
                    text: "United Group Company",
                    content:
                        "Sed ut perspiciatis unde omnis iste natus\nerror sit voluptatem accusantium doloremque laudantium.",
                    country: "Kenya",
                    hour: 4,
                    price: "11100",
                    rate: 2),
                const SizedBox(
                  height: 5,
                ),
                segmentValue(
                    image: "assets/D.png",
                    text: "United Group Company",
                    content:
                        "Sed ut perspiciatis unde omnis iste natus\nerror sit voluptatem accusantium doloremque laudantium.",
                    country: "Egypt",
                    hour: 8,
                    price: "4200",
                    rate: 4),
                const SizedBox(
                  height: 5,
                ),
                segmentValue(
                    image: "assets/circle.png",
                    text: "United Group Company",
                    content:
                        "Sed ut perspiciatis unde omnis iste natus\nerror sit voluptatem accusantium doloremque laudantium.",
                    country: "Libya",
                    hour: 4,
                    price: "5000",
                    rate: 3),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget segmentValue(
      {required String image,
      required String text,
      required String content,
      required String country,
      required int hour,
      required String price,
      required double rate,
      bool color = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: color
              ? Border.all(width: 1, color: Color(Const.scaffoldColors))
              : null),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 40, height: 40, child: Image.asset(image)),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              text,
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: Const.fontThree,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RatingBarIndicator(
                              rating: rate,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 18.0,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.grey[500],
                              fontSize: Const.fontSex,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          price,
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.black,
                              fontSize: Const.fontTwo,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ]),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: Const.fontTen),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    country,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Const.fontEight,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Hourly cleaning",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Const.fontEight,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$hour Hours",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Const.fontEight,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pageThree(
      {required TextEditingController visits,
      required BuildContext context,
      required List year,
      required List days,
      required List daysNum,
      required List hour}) {
    return Builder(builder: (context) {
      indexPageView = 3;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(Const.yourLocationColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.pin_drop_rounded,
                      color: Color(Const.indicator),
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "your location",
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
                        "Please add your address",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Const.fontSex,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Quicksand"),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFromFieldWidget(EvaIcons.arrowIosDownward,
              onTap: () {},
              maxLine: 1,
              text: "Number of visits",
              hint: "2",
              textEditingController: visits, validator: (v) {
            return "Please enter your Number of visits";
          }, watch: true, textInputType: TextInputType.phone),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Choose Date & Time",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Quicksand",
                fontSize: Const.fontTwo,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 30,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Text(
                        year[index],
                        style: TextStyle(
                            fontSize: Const.fontThree,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                            color:
                                index == 0 ? Colors.black : Colors.grey[300]),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: year.length)),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 95,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                        height: 90,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index == 0
                                ? Color(Const.scaffoldColors)
                                : Colors.grey[300]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              days[index],
                              style: TextStyle(
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                  fontFamily: "Quicksand",
                                  fontSize: Const.fontTen,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              " ${daysNum[index]}",
                              style: TextStyle(
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                  fontFamily: "Quicksand",
                                  fontSize: Const.fontSeven,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: daysNum.length)),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Choose Time",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Quicksand",
                fontSize: Const.fontTwo,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 38,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                        height: 38,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index == 0
                                ? Color(Const.scaffoldColors)
                                : Colors.grey[300]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              hour[index],
                              style: TextStyle(
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                  fontFamily: "Quicksand",
                                  fontSize: Const.fontTen,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: hour.length)),
        ],
      );
    });
  }
}
