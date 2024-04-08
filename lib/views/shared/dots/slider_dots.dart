import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../services/appcolors.dart';

class SliderDots extends StatelessWidget {
  final double activeDot;
  const SliderDots({super.key, required this.activeDot});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: activeDot,
      decorator: DotsDecorator(
          size: const Size.square(11.0),
          color: const Color.fromRGBO(223, 230, 233, 1),
          activeColor: AppColors.mainColor,
          activeSize: const Size(18.0, 11.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0))
          ),
    );
  }
}
