import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labor/components/navigator.dart';
import 'package:labor/components/our_services.dart';
import 'package:labor/components/smooth_indicator.dart';
import 'package:labor/cubit/cubit..dart';
import 'package:labor/cubit/states.dart';
import 'package:labor/modules/add_card/add_card.dart';
import 'package:labor/shared/const.dart';

class Categories extends StatelessWidget {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaborCubit, LaborStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaborCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 10 / 9.1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      navigator(context: context, widget: AddCard());
                    },
                    child: OurServices(
                        image: cubit.imageServices[index],
                        text: cubit.textServices[index]),
                  ),
                  itemCount: 6,
                  physics: const BouncingScrollPhysics(),
                  // shrinkWrap: true,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
