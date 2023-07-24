import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/otp_widget.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/otp/otp.dart';
import 'package:labor/modules/reset_Password/reset_password.dart';
import 'package:labor/shared/const.dart';

class Otp extends StatelessWidget {
  TextEditingController otpOne = TextEditingController();
  TextEditingController otpTwo = TextEditingController();
  TextEditingController otpThree = TextEditingController();
  TextEditingController otpFour = TextEditingController();

  GlobalKey<FormState> form = GlobalKey<FormState>();
  String number;
  Otp({required this.number});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: form,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "OTP",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.black,
                              fontSize: Const.fontSeven,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "An Authentecation code has been sent to\n$number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.grey[600],
                              fontSize: Const.fontEight,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OtpWidget(
                              autoFocus: true,
                              textEditingController: otpOne,
                              func: (v) {
                                if (v!.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                            ),
                            OtpWidget(
                              autoFocus: false,
                              textEditingController: otpTwo,
                              func: (v) {
                                if (v!.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                            ),
                            OtpWidget(
                                autoFocus: false,
                                textEditingController: otpThree,
                                func: (v) {
                                  if (v!.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                }),
                            OtpWidget(
                                autoFocus: false,
                                textEditingController: otpThree,
                                func: (v) {
                                  if (v!.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                }),
                            OtpWidget(
                                autoFocus: false,
                                textEditingController: otpThree,
                                func: (v) {
                                  if (v!.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                }),
                            OtpWidget(
                                autoFocus: false,
                                textEditingController: otpFour,
                                func: (v) {
                                  if (v!.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (form.currentState!.validate()) {
                              String otp = "$otpOne$otpTwo$otpThree$otpFour";
                              if (otp == cubit.otp) {
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(SnackBar(
                                //         content: Text(
                                //   cubit.authModel!.password,
                                //   style: TextStyle(
                                //       color: Colors.black,
                                //       fontFamily: "Quicksand",
                                //       fontSize: Const.fontTwo,
                                //       fontWeight: FontWeight.bold),
                                // )));
                                navigator(
                                    context: context,
                                    widget: ResetPassword(number: number));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      content: Text(
                                "Please Enter Your Otp",
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )));
                            }
                          },
                          child: WelcomePageButton(
                              color: Color(Const.scaffoldColors),
                              text: "Submit",
                              font: Const.fontThree),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: "Code Sent. Resend Code in ",
                              style: TextStyle(
                                  fontFamily: "Quicksand",
                                  color: Colors.grey[600],
                                  fontSize: Const.fontSex),
                              children: [
                                TextSpan(
                                    text: "00:50",
                                    style: TextStyle(
                                        fontFamily: "Quicksand",
                                        color: Color(Const.indicator),
                                        fontSize: Const.fontSex))
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
