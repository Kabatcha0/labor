import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/our_services.dart';
import 'package:labor/components/smooth_indicator.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/process/process.dart';
import 'package:labor/shared/const.dart';

class Home extends StatelessWidget {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: "good morning ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand",
                        color: Colors.grey[600],
                        fontSize: Const.fontSex),
                    children: [
                      TextSpan(
                          text: "Maged",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              fontWeight: FontWeight.bold,
                              color: Color(Const.indicator),
                              fontSize: Const.fontSex))
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Find your home service\nNeed a helping hand today?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Const.fontNine,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quicksand"),
              ),
              const SizedBox(
                height: 15,
              ),
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
                            "Jiddah Alexander Language School , ALS",
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
                height: 10,
              ),
              Container(
                  height: 140,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 140,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.asset("assets/banner.png"),
                    ),
                    itemCount: 3,
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothIndicatorWidget(
                    pageController: pageController,
                    count: 3,
                    activeColor: Color(Const.indicator),
                    color: const Color.fromARGB(255, 185, 184, 184),
                    dotHeight: 9,
                    dotWidth: 9,
                    expansion: 1.5,
                    raduis: 5,
                    spacing: 7,
                    strokeWidth: 28,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Our services",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Const.fontThree,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand"),
                  ),
                  Text(
                    "See ALL",
                    style: TextStyle(
                        color: Color(Const.scaffoldColors),
                        fontSize: Const.fontSex,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 10 / 9.1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      navigator(
                          context: context,
                          widget: Process(
                              name: cubit.textServices[index],
                              image: cubit.imageServices[index]));
                    },
                    child: OurServices(
                        image: cubit.imageServices[index],
                        text: cubit.textServices[index]),
                  ),
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(),
                  // shrinkWrap: true,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
