import 'package:flutter/material.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';

class HotelCard extends StatelessWidget {
  final AssetImage assetImage;
  final String title;
  final String text;
  final String description;
  const HotelCard({super.key, required this.assetImage, required this.title, required this.text, required this.description});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width - 48,
      height: height * 0.21,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.4,
            height: height * 0.21,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), bottomLeft: Radius.circular(Dimensions.radius20)),
                image: DecorationImage(
                    image: assetImage,
                  fit: BoxFit.cover
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal30 / 2, vertical: Dimensions.vertical30 / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text: title, style: TextStyle(color: AppColors.titleColor, fontSize: Dimensions.font18, fontFamily: "Montserrat", fontWeight: FontWeight.w600)),
                    TextSpan(text: text, style: TextStyle(color: AppColors.titleColor, fontSize: Dimensions.font14, fontFamily: "Lato", fontWeight: FontWeight.w500))
                  ]
                )),
                const SizedBox(height: 5,),
                DefaultText(text: description, color: AppColors.titleColor, fontSize: Dimensions.font12, fontWeight: FontWeight.w400)
              ],
            ),
          )
        ],
      ),
    );
  }
}
