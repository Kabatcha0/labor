import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/listTile.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/contact/contact_us.dart';
import 'package:labor/modules/edit/edit.dart';
import 'package:labor/modules/login/login.dart';
import 'package:labor/modules/notifications/notifications.dart';
import 'package:labor/modules/payment/payment.dart';
import 'package:labor/modules/select_address/select_address.dart';
import 'package:labor/shared/const.dart';

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 86,
                  width: 86,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Image.network(cubit.authModel!.profile),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Mohamed Mostafa esmail",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: Const.fontTwo,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  onTap: () {
                    navigator(context: context, widget: Edit());
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(Const.scaffoldColors)),
                      width: 76,
                      height: 32,
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: Const.fontEight,
                            color: Colors.white,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTileWidget(
                          onTap: () {
                            navigator(
                                context: context, widget: const Payment());
                          },
                          icon: Icons.payment,
                          widget: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 25,
                            color: Colors.black,
                          ),
                          text: "Payment Methods",
                          textTwo: "Add your credit & debit cards",
                          column: true,
                        ),
                        ListTileWidget(
                            onTap: () {
                              navigator(
                                  context: context,
                                  widget: const SelectAddress());
                            },
                            icon: Icons.location_pin,
                            widget: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 25,
                              color: Colors.black,
                            ),
                            column: true,
                            text: "Location",
                            textTwo: "Add your Home Location"),
                        ListTileWidget(
                            onTap: () {
                              navigator(
                                  context: context,
                                  widget: const Notifications());
                            },
                            icon: Icons.notifications,
                            column: true,
                            widget: Switch.adaptive(
                                value: cubit.theSwitch,
                                activeTrackColor: Color(Const.scaffoldColors),
                                activeColor: Colors.white,
                                onChanged: (v) {
                                  cubit.changeSwitch();
                                }),
                            text: "Push Notification",
                            textTwo: "For daily update and others"),
                        ListTileWidget(
                            onTap: () {
                              navigator(context: context, widget: Contact());
                            },
                            column: true,
                            icon: Icons.call,
                            widget: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 25,
                              color: Colors.black,
                            ),
                            text: "Contact Us",
                            textTwo: "For more information"),
                        ListTileWidget(
                            onTap: () {
                              cubit.out(context: context, widget: Login());
                            },
                            icon: Icons.logout_outlined,
                            widget: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 25,
                              color: Colors.black,
                            ),
                            text: "Logout",
                            textTwo: "",
                            column: false),
                      ],
                    ),
                  ),
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
