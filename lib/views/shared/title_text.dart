import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const TitleText({super.key, required this.title, required this.color, required this.fontSize, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Montserrat",
        height: 1.2
      ),
    );
  }
}
