import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/shared/const.dart';

class Contact extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Contact Us",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We are pleased to contact you to\nhear your inquiries and opinions",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      color: Colors.grey,
                      fontSize: Const.fontOne,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFromFieldWidget(null,
                    onTap: () {},
                    maxLine: 1,
                    text: "Name",
                    hint: "Name",
                    textEditingController: name, validator: (v) {
                  return "Please Enter Your Name";
                }, watch: false, textInputType: TextInputType.name),
                const SizedBox(
                  height: 10,
                ),
                TextFromFieldWidget(null,
                    onTap: () {},
                    text: "Phone",
                    maxLine: 1,
                    hint: "Phone",
                    textEditingController: phone, validator: (v) {
                  return "Please Enter Your Phone";
                }, watch: false, textInputType: TextInputType.phone),
                const SizedBox(
                  height: 10,
                ),
                TextFromFieldWidget(null,
                    onTap: () {},
                    text: "Message",
                    hint: "Message",
                    maxLine: 6,
                    textEditingController: message, validator: (v) {
                  return "Please Enter Your Message";
                }, watch: false, textInputType: TextInputType.name),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: WelcomePageButton(
                      color: Color(Const.scaffoldColors),
                      text: "Save",
                      font: Const.fontThree),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
