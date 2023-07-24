import 'package:flutter/material.dart';
import 'package:labor/shared/const.dart';

class OtpWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  Function(String?) func;
  bool autoFocus = false;

  OtpWidget({
    super.key,
    required this.func,
    required this.autoFocus,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: 55,
        child: Theme(
          data: ThemeData(
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: Color(Const.scaffoldColors))),
          child: TextFormField(
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            onChanged: func,
            controller: textEditingController,
            keyboardType: TextInputType.phone,
            cursorColor: Color(Const.scaffoldColors),
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: Colors.grey.shade600, width: 1.2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: Colors.grey.shade600, width: 1.2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Color(Const.scaffoldColors), width: 1.2)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            ),
            style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: Const.fontTwo,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ));
  }
}
