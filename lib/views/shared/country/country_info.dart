import 'package:flutter/material.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../text/default_text.dart';

class CountryInfo extends StatelessWidget {
  final IconData iconData;
  final String text;
  const CountryInfo({super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.iconBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(iconData, color: Colors.black, size: Dimensions.iconSize24),
          ),
        ),
        SizedBox(width: Dimensions.width10,),
        DefaultText(text: text, color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w400)
      ],
    );
  }
}
