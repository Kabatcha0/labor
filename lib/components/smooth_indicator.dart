import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:labor/shared/const.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorWidget extends StatelessWidget {
  PageController pageController;
  int dotWidth;
  int dotHeight;
  double expansion;
  int spacing;
  int raduis;
  int strokeWidth;
  Color color;
  int count;
  Color activeColor;

  SmoothIndicatorWidget(
      {required this.pageController,
      required this.activeColor,
      required this.color,
      required this.count,
      required this.dotHeight,
      required this.dotWidth,
      required this.expansion,
      required this.raduis,
      required this.spacing,
      required this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: Color(Const.scaffoldColors),
          dotColor: const Color.fromARGB(255, 185, 184, 184),
          dotHeight: 9,
          dotWidth: 9,
          expansionFactor: 3,
          radius: 5,
          spacing: 7,
          strokeWidth: 14,
        ));
  }
}
