import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/layout/layout.dart';
import 'package:labor/modules/login/login.dart';
import 'package:labor/modules/onBoarding/onBoarding.dart';
import 'package:labor/modules/selectLanguage/select_Language.dart';
import 'package:labor/shared/const.dart';
import 'package:labor/shared/network/local/local.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool check = CacheHelper.getData(key: "onBoard") ?? false;
  String uid = CacheHelper.getData(key: "uid") ?? "";
  @override
  void initState() {
    if (check) {
      Timer(const Duration(seconds: 4), () {
        navigatorRemove(context: context, widget: const SelectLanguage());
      });
    } else {
      if (uid == "") {
        Timer(const Duration(seconds: 4), () {
          navigatorRemove(context: context, widget: Login());
        });
      } else {
        Timer(const Duration(seconds: 4), () {
          navigatorRemove(context: context, widget: const Layout());
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Scaffold(
          backgroundColor: Color(Const.scaffoldColors),
          body: SafeArea(
              child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SizedBox(
              width: 140,
              height: 140,
              child: Image.asset(
                "assets/splash.png",
              ),
            ),
          )),
        );
      },
      listener: (context, state) {},
    );
  }
}
