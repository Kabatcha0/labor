import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/layout/layout.dart';
import 'package:labor/modules/forget_Password/forget_password.dart';
import 'package:labor/modules/register/register.dart';
import 'package:labor/shared/const.dart';

class Login extends StatelessWidget {
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(builder: (context, state) {
      var cubit = LaborCubit.get(context);
      return Scaffold(
        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 10),
          child: Form(
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
                  TextFromFieldWidget(Icons.phone,
                      maxLine: 1,
                      text: "Phone",
                      hint: "Enter Your Phone",
                      textEditingController: phone, validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter Your Password";
                    }
                    return null;
                  },
                      watch: false,
                      onTap: null,
                      textInputType: TextInputType.phone),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFromFieldWidget(
                      cubit.check ? Icons.visibility_off : Icons.visibility,
                      onTap: () {
                        cubit.checkEye();
                      },
                      maxLine: 1,
                      text: "Password",
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
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          navigator(context: context, widget: ForgetPassword());
                        },
                        child: Text(
                          "Forget Password ?",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.black,
                              fontSize: Const.fontTwo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (form.currentState!.validate()) {
                        cubit.auth(
                            phone: phone.text,
                            password: pass.text,
                            context: context);
                      }
                    },
                    child: WelcomePageButton(
                        color: Color(Const.scaffoldColors),
                        text: "Login",
                        font: Const.fontThree),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        color: Colors.black,
                        fontSize: Const.fontSex,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 64,
                    decoration: BoxDecoration(color: Colors.grey[420]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Facebook_f_logo_%282021%29.svg/1200px-Facebook_f_logo_%282021%29.svg.png"),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.black,
                              fontSize: Const.fontThree,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 64,
                    decoration: BoxDecoration(color: Colors.grey[420]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2008px-Google_%22G%22_Logo.svg.png"),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.black,
                              fontSize: Const.fontThree,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      navigator(context: context, widget: Register());
                    },
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: "Don’t Have Account ?",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.black,
                              fontSize: Const.fontTwo,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                                text: " Sign Up",
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    color: Color(Const.scaffoldColors),
                                    fontSize: Const.fontTwo,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ),
                  if (state is LaborAuthLoadingState) ...[
                    const SizedBox(
                      height: 10,
                    ),
                    LinearProgressIndicator(color: Color(Const.scaffoldColors))
                  ]
                ],
              ),
            ),
          ),
        )),
      );
    }, listener: (context, state) {
      if (state is LaborAuthSuccessState) {
        navigatorRemove(context: context, widget: const Layout());
      }
    });
  }
}
