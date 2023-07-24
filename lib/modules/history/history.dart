import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/show_dialog.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/layout/layout.dart';
import 'package:labor/modules/company/company.dart';
import 'package:labor/shared/const.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CupertinoSegmentedControl<int>(
                borderColor: Colors.transparent,
                pressedColor: Colors.transparent,
                children: {
                  0: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
                    child: Column(
                      children: [
                        Text(
                          "Ongoing",
                          style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: Const.fontTwo,
                            color: cubit.segmentCurrent == 0
                                ? Colors.black
                                : Color(Const.buttonOfHistory),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (cubit.segmentCurrent == 0)
                          const SizedBox(
                            height: 4,
                          ),
                        if (cubit.segmentCurrent == 0)
                          Container(
                            width: 8,
                            height: 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(Const.scaffoldColors)),
                          ),
                      ],
                    ),
                  ),
                  1: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        Text(
                          "Past",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: Const.fontTwo,
                            color: cubit.segmentCurrent == 1
                                ? Colors.black
                                : Color(Const.buttonOfHistory),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (cubit.segmentCurrent == 1)
                          const SizedBox(
                            height: 4,
                          ),
                        if (cubit.segmentCurrent == 1)
                          Container(
                            width: 8,
                            height: 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(Const.scaffoldColors)),
                          ),
                      ],
                    ),
                  ),
                },
                onValueChanged: (i) {
                  cubit.segmentCurrentChange(i);
                },
                selectedColor: Colors.transparent,
                unselectedColor: Colors.transparent,
                groupValue: cubit.segmentCurrent,
              ),
              const SizedBox(
                height: 8,
              ),
              if (cubit.segmentCurrent == 0)
                segmentValue(
                    image: "assets/circle.png",
                    text: "United Group Company",
                    textOfButton: "Accept",
                    onTapCompany: () {
                      navigator(
                          context: context,
                          widget: Company(
                              image: "assets/circle.png",
                              name: "United Group Company",
                              rate: 4.5));
                    },
                    buttonColor: true,
                    payment: true,
                    onTap: () {},
                    price: "1500"),
              if (cubit.segmentCurrent == 0)
                const SizedBox(
                  height: 10,
                ),
              if (cubit.segmentCurrent == 0)
                segmentValue(
                    image: "assets/D.png",
                    onTap: () {
                      showDialogPopUp(
                          context: context,
                          title: "Your request is under review",
                          titleOfImage: "assets/inReview.png",
                          content:
                              "A confirmation message will be\nsent when your offer is accepted\nby the company");
                    },
                    onTapCompany: () {
                      navigator(
                          context: context,
                          widget: Company(
                              image: "assets/D.png",
                              name: "Nile Company",
                              rate: 4));
                    },
                    text: "Nile Company",
                    textOfButton: "in Review",
                    price: "650"),
              if (cubit.segmentCurrent == 1)
                const SizedBox(
                  height: 8,
                ),
              if (cubit.segmentCurrent == 1)
                segmentValue(
                    image: "assets/L.png",
                    text: "United Group Company",
                    textOfButton: "Done",
                    buttonColor: true,
                    onTapCompany: () {
                      navigator(
                          context: context,
                          widget: Company(
                              image: "assets/L.png",
                              name: "United Group Company",
                              rate: 3.5));
                    },
                    onTap: () {
                      showDialogPopUp(
                          context: context,
                          title: "Your request has been\ncompleted",
                          titleOfImage: "assets/done.png",
                          content: "The worker will be dispatched\non time");
                    },
                    price: "1500"),
              if (cubit.segmentCurrent == 1)
                segmentValue(
                    onTap: () {},
                    image: "assets/nile.png",
                    text: "Nile Company",
                    textOfButton: "Cancel",
                    onTapCompany: () {
                      navigator(
                          context: context,
                          widget: Company(
                              image: "assets/nile.png",
                              name: "Nile Company",
                              rate: 5));
                    },
                    red: true,
                    price: "650"),
            ],
          ),
        );
      },
    );
  }
}

Widget segmentValue(
    {required String image,
    required String text,
    required String textOfButton,
    required String price,
    required Function() onTap,
    required Function() onTapCompany,
    bool buttonColor = false,
    bool payment = false,
    bool red = false}) {
  return Container(
    width: double.infinity,
    height: 280,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      "contract cleaning",
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Colors.black,
                          fontSize: Const.fontThree,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "25ds458126fs5dha",
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Colors.grey[600],
                          fontSize: Const.fontSex,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: buttonColor
                            ? Color(Const.scaffoldColors)
                            : (red ? Colors.red : Color(Const.buttonOfHistory)),
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      textOfButton,
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Colors.white,
                          fontSize: Const.fontSex,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onTapCompany,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            rating: 5,
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
                  Text(
                    "22/7/2022",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontSize: Const.fontSex,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600]),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "1 Filipino worker under contract",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontSize: Const.fontSex,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600]),
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
              ],
            ),
            if (payment)
              const SizedBox(
                height: 8,
              ),
            if (payment)
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Complete payment methods",
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Color(Const.scaffoldColors),
                          fontSize: Const.fontEight,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(Const.scaffoldColors),
                      size: 16,
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    ),
  );
}
