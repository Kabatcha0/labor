import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/layout/layout.dart';
import 'package:labor/shared/const.dart';

void showDialogPopUp({
  required BuildContext context,
  required String title,
  required String titleOfImage,
  required String content,
}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(titleOfImage),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    fontSize: Const.fontThree,
                  ),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    fontSize: Const.fontEight,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                    onTap: () {
                      navigatorRemove(context: context, widget: const Layout());
                    },
                    child: WelcomePageButton(
                        color: Color(Const.scaffoldColors),
                        text: "Home",
                        font: Const.fontEight)),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: WelcomePageButton(
                        color: Colors.grey,
                        text: "Cancel",
                        font: Const.fontEight)),
              ],
            ),
          ));
}
