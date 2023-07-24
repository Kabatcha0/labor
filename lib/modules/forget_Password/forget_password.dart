import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/otp/otp.dart';
import 'package:labor/modules/reset_Password/reset_password.dart';
import 'package:labor/shared/const.dart';

class ForgetPassword extends StatelessWidget {
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

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
                          "Forget Password",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.black,
                              fontSize: Const.fontSeven,
                              fontWeight: FontWeight.bold),
                        ),
                        //
                        Text(
                          "Enter your Phone Number\nto reset password.",
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
                            maxLine: 1,
                            cubit.check
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onTap: null,
                            text: "Phone",
                            hint: "Enter Your Phone",
                            textEditingController: phone, validator: (v) {
                          if (v!.isEmpty) {
                            return "Please Enter Your Phone";
                          }
                          return null;
                        },
                            watch: cubit.check,
                            textInputType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (form.currentState!.validate()) {
                              cubit.forgetPassword(
                                  phone: phone.text,
                                  context: context,
                                  widget: Otp(number: phone.text));
                            }
                          },
                          child: WelcomePageButton(
                              color: Color(Const.scaffoldColors),
                              text: "Reset Password",
                              font: Const.fontThree),
                        ),
                        if (state is LaborVerifyLoadingState) ...[
                          const SizedBox(
                            height: 10,
                          ),
                          LinearProgressIndicator(
                              color: Color(Const.scaffoldColors))
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
        if (state is LaborVerifySuccessState) {
          navigator(context: context, widget: Otp(number: phone.text));
        }
      },
    );
  }
}
