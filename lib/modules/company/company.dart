import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/contact/contact_us.dart';
import 'package:labor/shared/const.dart';

class Company extends StatelessWidget {
  String image;
  String name;
  double rate;
  TextEditingController comment = TextEditingController();
  Company({
    required this.image,
    required this.name,
    required this.rate,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Company",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontThree,
                  fontFamily: "Quicksand"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      fontSize: Const.fontEleven,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 30,
                      color: Colors.yellow,
                    ),
                    Text(
                      "$rate",
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: Const.fontEleven,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Sed ut perspiciatis unde omnis iste natus\nerror sit voluptatem accusantium doloremqu",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      fontSize: Const.fontTwo,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Add Your Rate",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      fontSize: Const.fontTwo,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                RatingBarIndicator(
                  rating: 0,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: const EdgeInsets.only(left: 4, right: 5),
                  direction: Axis.horizontal,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Comments",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      fontSize: Const.fontTwo,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                comments(
                  assetName: "assets/L.png",
                  name: "Ahmed Ali",
                ),
                const SizedBox(
                  height: 10,
                ),
                comments(
                  assetName: "assets/L.png",
                  name: "Amr Said",
                ),
                const Spacer(),
                TextFromFieldWidget(null,
                    onTap: null,
                    text: "Add Comment",
                    hint: "Add Your Commemt",
                    textEditingController: comment, validator: (v) {
                  return "Please Enter Your Comment ";
                }, watch: false, maxLine: 1, textInputType: TextInputType.name)
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

Widget comments({
  required String assetName,
  required String name,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(assetName),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    fontSize: Const.fontEight,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "22/7/2022",
                style: TextStyle(
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    fontSize: Const.fontSex,
                    color: Colors.grey[300]),
              ),
            ],
          )
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        "Sed ut perspiciatis unde omnis iste natus\nerror sit voluptatem accusantium doloremqu",
        textAlign: TextAlign.start,
        style: TextStyle(
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold,
            fontSize: Const.fontTwo,
            color: Colors.grey),
      ),
    ],
  );
}
