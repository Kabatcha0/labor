import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/shared/const.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        if (cubit.authModel == null) {
          cubit.getDataAuth();
        }
        return Scaffold(
          appBar: cubit.AppbarHome[cubit.currentIndex],
          body: cubit.authModel == null
              ? Container()
              : cubit.body[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              currentIndex: cubit.currentIndex,
              onTap: (v) {
                cubit.changeIndex(v);
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Color(Const.scaffoldColors),
              unselectedItemColor: Colors.grey[400],
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.home,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.book,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.dashboard_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.person,
                    ),
                    label: ""),
              ]),
        );
      },
      listener: (context, state) {},
    );
  }
}
