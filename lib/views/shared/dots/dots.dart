import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final double activeDot;
  const Dots({super.key, required this.activeDot});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double dotsWidth = ((width - 48) / 3) - 12;
    return DotsIndicator(
      dotsCount: 3,
      position: activeDot,
      decorator: DotsDecorator(
          size: Size(dotsWidth, 2.0),
          color: const Color.fromRGBO(173, 173, 173, 1),
          activeColor: const Color.fromRGBO(255, 255, 255, 1),
          activeSize: Size(dotsWidth, 2.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
          shape: Border.all(color: const Color.fromRGBO(173, 173, 173, 1), width: 2.0)),
    );
  }
}
