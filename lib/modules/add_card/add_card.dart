import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/shared/const.dart';

class AddCard extends StatelessWidget {
  TextEditingController cardName = TextEditingController();
  TextEditingController cardType = TextEditingController();
  TextEditingController cardNum = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Add card",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontThree,
                  fontFamily: "Quicksand"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFromFieldWidget(null,
                    maxLine: 1,
                    onTap: () {},
                    text: "Card Name",
                    hint: "Mohamed Mostafa",
                    textEditingController: cardName, validator: (v) {
                  return "please enter ur card name";
                }, watch: false, textInputType: TextInputType.emailAddress),
                TextFromFieldWidget(EvaIcons.arrowIosDownward,
                    onTap: () {},
                    maxLine: 1,
                    text: "Card Type",
                    hint: "Visa",
                    textEditingController: cardType, validator: (v) {
                  return "Please enter your card number";
                }, watch: true, textInputType: TextInputType.phone),
                TextFromFieldWidget(null,
                    maxLine: 1,
                    onTap: () {},
                    text: "card Num",
                    hint: "card Num",
                    textEditingController: cardNum, validator: (v) {
                  return "Please enter your Card Num";
                }, watch: false, textInputType: TextInputType.name),
                TextFromFieldWidget(null,
                    onTap: () {},
                    text: "Exp Date",
                    maxLine: 1,
                    hint: "Exp Date",
                    textEditingController: date, validator: (v) {
                  return "please enter your Exp Date";
                }, watch: false, textInputType: TextInputType.phone),
                TextFromFieldWidget(null,
                    onTap: () {},
                    text: "Cvv",
                    maxLine: 1,
                    hint: "Cvv",
                    textEditingController: cvv, validator: (v) {
                  return "please enter your cvv";
                }, watch: false, textInputType: TextInputType.name),
                GestureDetector(
                    onTap: () {},
                    child: WelcomePageButton(
                        color: Color(Const.scaffoldColors),
                        text: "save",
                        font: Const.fontThree))
              ],
            ),
          ),
        );
      },
    );
  }
}
