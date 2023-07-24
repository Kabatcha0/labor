import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:labor/shared/const.dart';

class TextFromFieldWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  String text;
  String hint;
  Function()? onTap;
  IconData? iconData;
  bool watch;
  String? Function(String?)? validator;
  TextInputType textInputType;
  int maxLine = 1;
  TextFromFieldWidget(this.iconData,
      {required this.onTap,
      required this.text,
      required this.hint,
      required this.textEditingController,
      required this.validator,
      required this.watch,
      required this.maxLine,
      required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontFamily: "Quicksand",
              color: Colors.black,
              fontSize: Const.fontTwo,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6,
        ),
        Theme(
          data: ThemeData(
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: Color(Const.scaffoldColors))),
          child: TextFormField(
            validator: validator,
            controller: textEditingController,
            keyboardType: textInputType,
            maxLines: maxLine,
            obscureText: watch,
            cursorColor: Color(Const.scaffoldColors),
            decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 0.4)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 0.4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Color(Const.scaffoldColors), width: 0.4)),
                suffixIcon: InkWell(
                    onTap: onTap,
                    child: Icon(
                      iconData,
                      size: 24,
                      color: Colors.grey[600],
                    )),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                hintText: hint,
                hintStyle: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: Const.fontTwo,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600])),
            style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: Const.fontTwo,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        )
      ],
    );
  }
}
