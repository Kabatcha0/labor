import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/order_details/order_details.dart';
import 'package:labor/shared/const.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "My Wallet",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontThree,
                  fontFamily: "Quicksand"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    navigator(context: context, widget: OrderDetails());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(Const.yourLocationColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.wallet,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "My Balance",
                                style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: Const.fontTwo,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Quicksand"),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "100 SR",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Const.fontThree,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Quicksand"),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                wallet(
                    changeColor: true,
                    text: "Add To Wallet",
                    content: "100 SR have been added to\nyour balance"),
                const SizedBox(
                  height: 20,
                ),
                wallet(
                    changeColor: false,
                    text: "Wallet Discount",
                    content: "100 SR have been wallet\ndiscount"),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

Widget wallet({
  required bool changeColor,
  required String text,
  required String content,
}) {
  return Container(
    width: double.infinity,
    height: 110,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 0.4)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 35,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:
                      changeColor ? Color(Const.scaffoldColors) : Colors.red),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Const.fontSex,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quicksand"),
              ),
            ),
            Text(
              "2 hr",
              style: TextStyle(
                  color: Colors.grey[450],
                  fontSize: Const.fontSex,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Quicksand"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          content,
          style: TextStyle(
              color: Colors.grey[450],
              fontSize: Const.fontEight,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand"),
        ),
      ],
    ),
  );
}
