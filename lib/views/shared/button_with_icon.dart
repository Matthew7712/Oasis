import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oasis/views/shared/title_text.dart';

import '../../services/appcolors.dart';
import '../../services/dimensions.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final SvgPicture iconData;
  const ButtonWithIcon({
    super.key,
    required this.text,
    this.backgroundColor = const Color.fromRGBO(84, 64, 140, 1),
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 2 - 44,
      height: Dimensions.height50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 1, color: AppColors.inputBorderColor, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconData,
          SizedBox(
            width: Dimensions.width15 + 1 ,
          ),
          TitleText(title: text, color: AppColors.mainColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w400)
        ],
      ),
    );
  }
}