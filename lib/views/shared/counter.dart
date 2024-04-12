import 'package:flutter/material.dart';
import 'package:oasis/views/shared/text/default_text.dart';

import '../../services/appcolors.dart';
import '../../services/dimensions.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  void incrementFunction(){
    setState(() {
      counter++;
    });
  }

  void dicrementFunction(){
    setState(() {
      counter > 1 ? counter-- : counter+= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: dicrementFunction,
          child: Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: counter <= 1 ? Colors.grey.shade300 : AppColors.mainColor,
              border: Border.all(
                width: 2,
                color: counter <= 1 ? Colors.grey : AppColors.mainColor,
              ),
              borderRadius: BorderRadius.circular(Dimensions.radius50),
            ),
            child: Icon(Icons.remove, size: Dimensions.iconSize16, color: counter <= 1 ? AppColors.iconColor : AppColors.iconBackgroundColor),
          ),
        ),
        SizedBox(width: Dimensions.width15,),
        DefaultText(text: counter.toString(), fontSize: Dimensions.font16, color: AppColors.titleColor, fontWeight: FontWeight.w500,),
        SizedBox(width: Dimensions.width15,),
        GestureDetector(
          onTap: incrementFunction,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              border: Border.all(
                width: 2,
                color: AppColors.mainColor,
              ),
              borderRadius: BorderRadius.circular(Dimensions.radius30),
            ),
            child: Icon(Icons.add, size: Dimensions.iconSize16, color: AppColors.white),
          ),
        )
      ],
    );
  }
}
