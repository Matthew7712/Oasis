import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/text/title_text.dart';

import '../../../services/appcolors.dart';

class CountryCard extends StatelessWidget {
  final AssetImage assetImage;
  final String title;
  const CountryCard({super.key, required this.assetImage, required this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.4,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
        image: DecorationImage(
          image: assetImage,
          fit: BoxFit.cover
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal14, vertical: Dimensions.vertical20),
        child: TitleText(title: title, color: AppColors.white, fontSize: Dimensions.font24, fontWeight: FontWeight.w600),
      ),
    );
  }
}
