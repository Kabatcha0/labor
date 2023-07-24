import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/text_from_field.dart';
import 'package:labor/components/welcome_page_button.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/layout/layout.dart';
import 'package:labor/modules/login/login.dart';
import 'package:labor/shared/const.dart';

class Edit extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Edit Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Const.fontThree,
                  fontFamily: "Quicksand"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: 86,
                      width: 86,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: cubit.image == null
                          ? Image.network(cubit.authModel!.profile)
                          : Image.network(cubit.image!),
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: 86,
                      width: 86,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.6)),
                    ),
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 26,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFromFieldWidget(Icons.person,
                    text: "Full Name",
                    hint: "Enter Your Name",
                    maxLine: 1,
                    textEditingController: name, validator: (v) {
                  if (v!.isEmpty) {
                    return "Please Enter Your Name";
                  }
                  return null;
                },
                    watch: false,
                    onTap: null,
                    textInputType: TextInputType.name),
                const SizedBox(
                  height: 5,
                ),
                TextFromFieldWidget(Icons.phone,
                    text: "Phone",
                    hint: "Enter Your Phone",
                    maxLine: 1,
                    textEditingController: phone, validator: (v) {
                  if (v!.isEmpty) {
                    return "Please Enter Your Phone";
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
                    maxLine: 1,
                    text: "Passwrod",
                    hint: "Enter Your Paswword",
                    textEditingController: password,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter Your Password";
                      }
                      return null;
                    },
                    watch: cubit.checkConfirm,
                    onTap: () {
                      cubit.checkEyeConfirm();
                    },
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                    onTap: () {
                      cubit.edit(
                          newPassword: password.text,
                          name: name.text,
                          phone: phone.text);
                    },
                    child: WelcomePageButton(
                        color: Color(Const.scaffoldColors),
                        text: "Save Change",
                        font: Const.fontThree)),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    cubit.removeAccount(widget: Login(), context: context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 58,
                        width: 159,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red.withOpacity(0.2)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 20,
                            ),
                            Text(
                              "Delete Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Quicksand",
                                  fontSize: Const.fontTwo,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                if (state is LaborEditLoadingState) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(color: Color(Const.scaffoldColors))
                ]
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LaborEditSuccessState) {
          navigatorRemove(context: context, widget: const Layout());
        }
      },
    );
  }
}
