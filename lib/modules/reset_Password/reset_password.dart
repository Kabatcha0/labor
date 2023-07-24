import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/login/login.dart';
import 'package:labor/shared/const.dart';

class ResetPassword extends StatelessWidget {
  TextEditingController pass = TextEditingController();
  TextEditingController passTwo = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  String number;
  ResetPassword({required this.number});
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
              children: [
                Form(
                  key: form,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Login",
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
                          "Please Enter your Phone and password \nto continue",
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
                        TextFromFieldWidget(
                            cubit.check
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onTap: () {
                              cubit.checkEye();
                            },
                            maxLine: 1,
                            text: "Password",
                            hint: "Enter Your Password",
                            textEditingController: passTwo,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please Enter Your Password";
                              }
                              return null;
                            },
                            watch: cubit.check,
                            textInputType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFromFieldWidget(
                            cubit.check
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onTap: () {
                              cubit.checkEyeConfirm();
                            },
                            maxLine: 1,
                            text: "Confirm Password",
                            hint: "Enter Your Password",
                            textEditingController: pass,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please Enter Your Password";
                              }
                              return null;
                            },
                            watch: cubit.check,
                            textInputType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (form.currentState!.validate()) {
                              if (pass.text == passTwo.text) {
                                cubit.changePassword(
                                    password: pass.text,
                                    phone: number.replaceAll("+2", ""));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                  "Password != Confirm Password",
                                  style: TextStyle(
                                      fontFamily: "Quicksand",
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )));
                              }
                            }
                          },
                          child: WelcomePageButton(
                              color: Color(Const.scaffoldColors),
                              text: "Save Password",
                              font: Const.fontThree),
                        ),
                        if (state is LaborChangePasswordLoadingState) ...[
                          const SizedBox(
                            height: 10,
                          ),
                          LinearProgressIndicator(
                              color: Color(Const.scaffoldColors)),
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LaborChangePasswordSuccessState) {
          navigator(context: context, widget: Login());
        }
      },
    );
  }
}
