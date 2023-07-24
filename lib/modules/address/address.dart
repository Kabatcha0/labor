import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/add_address/add_address.dart';
import 'package:labor/shared/const.dart';

class Address extends StatelessWidget {
  TextEditingController city = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController building = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Address",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontThree,
                  fontFamily: "Quicksand"),
            ),
          ),
          body: SafeArea(
              child: Column(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFromFieldWidget(EvaIcons.arrowIosDownward,
                      onTap: () {},
                      maxLine: 1,
                      text: "City",
                      hint: "Riyadh",
                      textEditingController: city, validator: (v) {
                    return "Please enter your City";
                  }, watch: true, textInputType: TextInputType.phone),
                  TextFromFieldWidget(null,
                      maxLine: 1,
                      onTap: () {},
                      text: "Region",
                      hint: "Alexander Language School",
                      textEditingController: region, validator: (v) {
                    return "Please enter your Region";
                  }, watch: false, textInputType: TextInputType.name),
                  TextFromFieldWidget(null,
                      onTap: () {},
                      text: "Street",
                      maxLine: 1,
                      hint: "Add Your Street",
                      textEditingController: street, validator: (v) {
                    return "please enter your Street";
                  }, watch: false, textInputType: TextInputType.phone),
                  TextFromFieldWidget(null,
                      onTap: () {},
                      text: "Building",
                      maxLine: 1,
                      hint: "Add Number Of Building",
                      textEditingController: building, validator: (v) {
                    return "please enter Add Number Of Building";
                  }, watch: false, textInputType: TextInputType.name),
                  GestureDetector(
                      onTap: () {
                        navigator(context: context, widget: AddAdress());
                      },
                      child: WelcomePageButton(
                          color: Color(Const.scaffoldColors),
                          text: "Add",
                          font: Const.fontThree))
                ],
              ),
            ],
          )),
        );
      },
      listener: (context, state) {},
    );
  }
}
