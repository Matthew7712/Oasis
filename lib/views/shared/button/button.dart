import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import '../../../services/appcolors.dart';

class Button extends StatelessWidget {
  final String text;
  void Function() event;
  Button({super.key, required this.text, required this.event});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: event,
      child: Container(
        width: width - 48,
        height: height < 640 ? Dimensions.height42 : height < 731 ? Dimensions.height46 : Dimensions.buttonHeight50,
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
            border: Border.all(width: 1, color: AppColors.buttonBackgroundColor)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: AppColors.white,
                fontSize: Dimensions.font18,
                fontWeight: FontWeight.w500,
                fontFamily: "Lato"
            ),
          ),
        ),
      ),
    );
  }
}
