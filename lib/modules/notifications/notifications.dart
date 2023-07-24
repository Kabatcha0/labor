import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/notification_widget.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/shared/const.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Notification",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontThree,
                  fontFamily: "Quicksand"),
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                NotificationWidget(
                    complete: true,
                    assetName: "assets/verify.png",
                    text: "Order Confirmed",
                    textTwo: "Your order is Done\nregister payment methods",
                    hour: "1 hr"),
                const SizedBox(
                  height: 10,
                ),
                NotificationWidget(
                    complete: false,
                    assetName: "assets/message.png",
                    text: "Reminder",
                    textTwo: "House Shifting - #2F33J\nscheduled Tomorrow.",
                    hour: "2 hr"),
                const SizedBox(
                  height: 10,
                ),
                NotificationWidget(
                    complete: false,
                    assetName: "assets/cancel.png",
                    text: "Order Canceled",
                    textTwo: "Your order is Canceled\nTry agin",
                    hour: "Yesterday"),
              ],
            ),
          )),
        );
      },
      listener: (context, state) {},
    );
  }
}
