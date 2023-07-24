import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/payment_widget.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/shared/const.dart';

class OrderDetails extends StatelessWidget {
  TextEditingController notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Order Details",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontThree,
                  fontFamily: "Quicksand"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Order Detalis",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        fontSize: Const.fontThree,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      orderDetails(
                          name: "Name of Order",
                          nameOfDetails: "Hourly Cleaning",
                          content: "Date of Order",
                          contentOfDetails: "22/7/2020"),
                      const SizedBox(
                        height: 15,
                      ),
                      orderDetails(
                          name: "Code of Order",
                          nameOfDetails: "25ds458126fs5dha",
                          content: "Company",
                          contentOfDetails: "United Group Company"),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Detalis Order",
                                  style: TextStyle(
                                      fontFamily: "Quicksand",
                                      fontWeight: FontWeight.bold,
                                      fontSize: Const.fontSex,
                                      color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "1 Filipino worker under\ncontract",
                                  style: TextStyle(
                                      fontFamily: "Quicksand",
                                      fontWeight: FontWeight.bold,
                                      fontSize: Const.fontEight,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Order States",
                                  style: TextStyle(
                                      fontFamily: "Quicksand",
                                      fontWeight: FontWeight.bold,
                                      fontSize: Const.fontSex,
                                      color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 100,
                                  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(Const.scaffoldColors)),
                                  child: Text(
                                    "Done",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Const.fontSex,
                                        fontFamily: "Quicksand",
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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
                  Text(
                    "payment methods",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        fontSize: Const.fontThree,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 70,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "payment methods",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              fontWeight: FontWeight.bold,
                              fontSize: Const.fontTwo,
                              color: Colors.grey[600]),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Debit Card",
                              style: TextStyle(
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.bold,
                                  fontSize: Const.fontTwo,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              width: 8,
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(Const.scaffoldColors)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PaymentWidget(
                    assetName: "assets/visa.png",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Color(Const.scaffoldColors),
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add New Card",
                        style: TextStyle(
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                            fontSize: Const.fontThree,
                            color: Color(Const.scaffoldColors)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFromFieldWidget(null,
                      onTap: () {},
                      text: "Leave notes",
                      hint: "Your notes",
                      textEditingController: notes, validator: (v) {
                    return "Please your notes";
                  },
                      watch: false,
                      maxLine: 4,
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFromFieldWidget(Icons.verified,
                      onTap: () {},
                      text: "Add Cobon",
                      hint: "Labor 2022",
                      textEditingController: notes, validator: (v) {
                    return "Please your cobon";
                  },
                      watch: true,
                      maxLine: 1,
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Price",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        fontSize: Const.fontThree,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        rowPrice(text: "price order", price: "2500"),
                        rowPrice(text: "Tax", price: "250"),
                        rowPrice(text: "discount", price: "100", change: true),
                        rowPrice(text: "Total Price", price: "2650"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: WelcomePageButton(
                        color: Color(Const.scaffoldColors),
                        text: "Pay",
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
}

Widget rowPrice(
    {required String text, required String price, bool change = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyle(
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold,
            fontSize: Const.fontEight,
            color: change ? Color(Const.scaffoldColors) : Colors.black),
      ),
      Text(
        "$price SR",
        style: TextStyle(
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold,
            fontSize: Const.fontTwo,
            color: change ? Color(Const.scaffoldColors) : Colors.black),
      ),
    ],
  );
}

Widget orderDetails({
  required String name,
  required String nameOfDetails,
  required String content,
  required String contentOfDetails,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontSex,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              nameOfDetails,
              style: TextStyle(
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontEight,
                  color: Colors.black),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: TextStyle(
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontSex,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              contentOfDetails,
              style: TextStyle(
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontEight,
                  color: Colors.black),
            ),
          ],
        ),
      ],
    ),
  );
}
