import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/select_address_widget.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/address/address.dart';
import 'package:labor/shared/const.dart';

class SelectAddress extends StatelessWidget {
  const SelectAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Select Address",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontThree,
                  fontFamily: "Quicksand"),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigator(context: context, widget: Address());
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SelectAddressWidget(
                    check: true,
                    color: Color(Const.scaffoldColors),
                    city: "Riyadh",
                    region: "Alexander Language\nSchool",
                    street: "Non",
                    building: "2 Floor"),
                const SizedBox(
                  height: 10,
                ),
                SelectAddressWidget(
                    check: false,
                    color: Colors.white,
                    city: "Riyadh",
                    region: "Alexander Language\nSchool",
                    street: "Non",
                    building: "2 Floor"),
                const SizedBox(
                  height: 10,
                ),
                SelectAddressWidget(
                    check: false,
                    color: Colors.white,
                    city: "Riyadh",
                    region: "Alexander Language\nSchool",
                    street: "Non",
                    building: "2 Floor"),
                const Spacer(),
                WelcomePageButton(
                    color: Color(Const.scaffoldColors),
                    text: "Select",
                    font: Const.fontThree)
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
